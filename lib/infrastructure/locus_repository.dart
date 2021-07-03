import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/core/failures.dart';
import '../domain/locus/i_locus_data_source.dart';
import '../domain/locus/i_locus_repository.dart';
import '../domain/locus/locus.dart';
import 'feature_dto.dart';

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
        locusList.map(
          (locusData) {
            late final List<FeatureDto> featuresToCompare = [];
            int accumulativeOverlap = 0;
            locusData.features.sort((a, b) => a.start.compareTo(b.start));
            final newLocusData = locusData.copyWith(
              features: locusData.features.map(
                (feature) {
                  int overlapLevel = 0;
                  var typeByOverlap = feature.type;
                  if (feature.type.toLowerCase() != 'source' &&
                      feature.type.toLowerCase() != 'gene' &&
                      feature.type.toLowerCase() != 'mrna') {
                    overlapLevel = featuresToCompare
                        .where(
                          (featureToCompare) =>
                              feature.type == featureToCompare.type &&
                              feature.start <= featureToCompare.end,
                        )
                        .length;
                    if (overlapLevel > 0) {
                      overlapLevel += accumulativeOverlap;
                      typeByOverlap += '#$overlapLevel';
                      accumulativeOverlap++;
                    } else {
                      accumulativeOverlap = 0;
                    }
                    featuresToCompare.add(feature);
                  }
                  final featureWithOverlapLevel = feature.copyWith(
                    typeByOverlap: typeByOverlap,
                  );

                  return featureWithOverlapLevel;
                },
              ).toList(),
            );

            return newLocusData.toDomain();
          },
        ).toImmutableList(),
      ),
    );
  }
}
