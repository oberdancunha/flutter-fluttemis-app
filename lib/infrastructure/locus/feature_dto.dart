import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/value_transformer.dart';
import '../../domain/locus/feature.dart';

part 'feature_dto.freezed.dart';

@freezed
class FeatureDto with _$FeatureDto {
  const FeatureDto._();

  const factory FeatureDto({
    required int start,
    required int end,
    required String type,
    required int strand,
    String? typeByOverlap,
    String? name,
    String? product,
    String? nucleotides,
    String? aminoacids,
    String? note,
  }) = _FeatureDto;

  Feature toDomain() => Feature(
        id: start.toString() + end.toString() + strand.toString() + type,
        start: start,
        end: end,
        strand: strand,
        type: type,
        typeByOverlap: typeByOverlap ?? type,
        aminoacids: aminoacids,
        nucleotides: nucleotides,
        name: name,
        note: note,
        product: product,
        color: colorLocusFeatureByProduct(product ?? ''),
        show: shouldDrawFeature(type),
      );
}
