import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import 'feature.dart';
import 'features_report.dart';

part 'locus.freezed.dart';

@freezed
class Locus with _$Locus {
  const Locus._();

  const factory Locus({
    required String name,
    required int length,
    required String type,
    required String organism,
    required KtList<Feature> features,
    required FeaturesReport featuresReport,
    String? shape,
    String? releaseDate,
    String? sequence,
  }) = _Locus;

  factory Locus.empty() => Locus(
        name: '',
        length: 0,
        type: '',
        organism: '',
        features: const KtList.empty(),
        featuresReport: FeaturesReport.empty(),
      );
}
