import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import 'feature.dart';

part 'locus.freezed.dart';

@freezed
class Locus with _$Locus {
  const Locus._();

  const factory Locus({
    required String name,
    required int length,
    required String type,
    required String organism,
    String? shape,
    String? releaseDate,
    String? sequence,
    KtList<Feature>? features,
  }) = _Locus;

  factory Locus.empty() => const Locus(
        name: '',
        length: 0,
        type: '',
        organism: '',
        features: KtList.empty(),
      );
}
