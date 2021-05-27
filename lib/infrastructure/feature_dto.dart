import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/locus/feature.dart';

part 'feature_dto.freezed.dart';

@freezed
class FeatureDto with _$FeatureDto {
  const FeatureDto._();

  const factory FeatureDto({
    required int start,
    required int end,
    required String type,
    required int strand,
    String? name,
    String? product,
    String? nucleotides,
    String? aminoacids,
    String? note,
  }) = _FeatureDto;

  Feature toDomain() => Feature(
        start: start,
        end: end,
        strand: strand,
        type: type,
        aminoacids: aminoacids,
        name: name,
        note: note,
        product: product,
      );
}
