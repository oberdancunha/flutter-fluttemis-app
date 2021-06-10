import 'package:bio/seqio/genbank.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import '../domain/core/failures.dart';
import '../domain/locus/i_locus_data_source.dart';
import '../domain/locus/locus.dart';
import 'feature_dto.dart';
import 'locus_dto.dart';

class LocusDataSourceGenbankFile implements ILocusDataSource {
  late final String? genbankFile;
  final genbank = Genbank();

  LocusDataSourceGenbankFile({
    required this.genbankFile,
  });

  @override
  Future<Either<Failure, KtList<Locus>>> getLocus() async {
    final locus = await genbank.open(genbankFile!);

    return locus.when(
      failure: (failure) => failure.when(
        fileNotFound: () => left(const Failure.fileNotFound()),
        fileParserError: (error) => left(Failure.fileParserError(error: error)),
        fileIsEmpty: () => left(const Failure.fileIsEmpty()),
        fileFormatIncorrect: () => left(const Failure.fileFormatIncorrect()),
      ),
      data: (genbankData) => right(
        genbankData
            .asList()
            .map(
              (data) => LocusDto(
                name: data.locus.name,
                length: data.locus.length,
                type: data.locus.type,
                shape: data.locus.shape,
                organism: data.locusDetails.source!,
                releaseDate: data.locus.releaseDate,
                sequence: data.locus.sequence,
                features: data.features
                    .asList()
                    .map(
                      (feature) => FeatureDto(
                        start: feature.start,
                        end: feature.end,
                        type: feature.type,
                        strand: feature.strand,
                        aminoacids: feature.aminoacids,
                        name: feature.name,
                        note: feature.note,
                        product: feature.product,
                      ).toDomain(),
                    )
                    .toList(),
              ).toDomain(),
            )
            .toImmutableList(),
      ),
    );
  }
}
