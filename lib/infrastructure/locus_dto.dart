import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../domain/locus/locus.dart';
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
    String? releaseDate,
    String? sequence,
    List<FeatureDto>? features,
  }) = _LocusDto;

  Locus toDomain() => Locus(
        name: name,
        length: length,
        organism: organism,
        type: type,
        releaseDate: releaseDate,
        sequence: sequence,
        features: features!
            .map(
              (feature) => feature.toDomain(),
            )
            .toImmutableList(),
      );
}
