import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/core/failures.dart';
import '../../domain/core/value_transformer.dart';
import '../../domain/locus/i_locus_repository.dart';
import '../../domain/locus/locus.dart';
import 'feature_dto.dart';
import 'i_locus_data_source.dart';

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
            int overlapLevel = 0;
            locusData.features.sort(
              (featureDtoA, featureDtoB) => featureDtoB.start.compareTo(featureDtoA.start),
            );
            final newLocusData = locusData.copyWith(
              features: locusData.features.map(
                (feature) {
                  var typeByOverlap = feature.type;
                  if (shouldDrawFeature(feature.type)) {
                    overlapLevel = featuresToCompare
                        .where(
                          (featureToCompare) =>
                              feature.type == featureToCompare.type &&
                              featureToCompare.start <= feature.end,
                        )
                        .length;
                    if (overlapLevel > 0) {
                      if (accumulativeOverlap == 0 || overlapLevel > 1) {
                        overlapLevel -= accumulativeOverlap;
                        typeByOverlap += '#$overlapLevel';
                        accumulativeOverlap++;
                      } else {
                        overlapLevel = 0;
                        accumulativeOverlap = 0;
                      }
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
