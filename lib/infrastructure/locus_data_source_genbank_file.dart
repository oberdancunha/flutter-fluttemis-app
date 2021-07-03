import 'dart:io';

import 'package:bio/seqio/genbank.dart';
import 'package:dartz/dartz.dart';

import '../domain/core/failures.dart';
import '../domain/locus/i_locus_data_source.dart';
import 'feature_dto.dart';
import 'locus_dto.dart';

class LocusDataSourceGenbankFile implements ILocusDataSource {
  late final String genbankFile;
  final genbank = Genbank();

  LocusDataSourceGenbankFile({
    required this.genbankFile,
  });

  @override
  Future<Either<Failure, List<LocusDto>>> getLocus() async {
    final locus = await genbank.open(genbankFile);

    return locus.when(
      failure: (failure) {
        final genbankFileName = File(genbankFile).path.split('/').last;
        const fileType = 'genbank';

        return failure.when(
          fileNotFound: () => left(Failure.fileNotFound(
            fileName: genbankFileName,
            fileType: fileType,
          )),
          fileParserError: (error) => left(Failure.fileParserError(
            fileName: genbankFileName,
            fileType: fileType,
            error: error,
          )),
          fileIsEmpty: () => left(Failure.fileIsEmpty(
            fileName: genbankFileName,
            fileType: fileType,
          )),
          fileFormatIncorrect: () => left(Failure.fileFormatIncorrect(
            fileName: genbankFileName,
            fileType: fileType,
          )),
        );
      },
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
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
