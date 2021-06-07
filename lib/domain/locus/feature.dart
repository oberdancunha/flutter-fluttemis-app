import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/constants.dart';

part 'feature.freezed.dart';

@freezed
class Feature with _$Feature {
  const Feature._();

  const factory Feature({
    required int start,
    required int end,
    required String type,
    required int strand,
    required Color color,
    String? name,
    String? product,
    String? nucleotides,
    String? aminoacids,
    String? note,
  }) = _Feature;

  factory Feature.empty() => const Feature(
        start: 0,
        end: 0,
        type: '',
        strand: 0,
        color: colorLocusFeatureNotProduct,
      );
}
