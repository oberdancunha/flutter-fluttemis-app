import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/locus/features_report.dart';
import '../../domain/locus/locus.dart';
import 'feature_dto.dart';

part 'locus_dto.freezed.dart';

@freezed
abstract class LocusDto with _$LocusDto {
  const LocusDto._();

  const factory LocusDto({
    required String name,
    required int length,
    required String type,
    required String organism,
    required List<FeatureDto> features,
    String? shape,
    String? releaseDate,
    String? sequence,
  }) = _LocusDto;

  Locus toDomain() => Locus(
        name: name,
        length: length,
        organism: organism,
        type: type,
        shape: shape,
        releaseDate: releaseDate,
        sequence: sequence,
        features: features.map((feature) => feature.toDomain()).toImmutableList(),
        featuresReport: FeaturesReport(features.map((feature) => feature.toDomain()).toList()),
      );
}
