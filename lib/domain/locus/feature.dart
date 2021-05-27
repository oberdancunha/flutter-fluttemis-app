import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature.freezed.dart';

@freezed
class Feature with _$Feature {
  const Feature._();

  const factory Feature({
    required int start,
    required int end,
    required String type,
    required int strand,
    String? name,
    String? product,
    String? nucleotides,
    String? aminoacids,
    String? note,
  }) = _Feature;
}
