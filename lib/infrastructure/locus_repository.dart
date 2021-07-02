import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/core/failures.dart';
import '../domain/locus/i_locus_data_source.dart';
import '../domain/locus/i_locus_repository.dart';
import '../domain/locus/locus.dart';

class LocusRepository implements ILocusRepository {
  final ILocusDataSource locusDataSource;

  LocusRepository({
    required this.locusDataSource,
  });

  @override
  Future<Either<Failure, KtList<Locus>>> getLocus() async {
    final locus = await locusDataSource.getLocus();

    return locus.fold(
      left,
      (locusList) => right(
        locusList.map((locusData) => locusData.toDomain()).toImmutableList(),
      ),
    );
  }
}
