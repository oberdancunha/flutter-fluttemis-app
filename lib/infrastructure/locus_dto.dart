import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/locus/feature.dart';
import '../../utils/product_dictionary.dart';
import '../domain/locus/locus.dart';

part 'locus_dto.freezed.dart';

@freezed
abstract class LocusDto with _$LocusDto {
  const LocusDto._();

  const factory LocusDto({
    required String name,
    required int length,
    required String type,
    required String organism,
    required List<Feature> features,
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
        features: features.toImmutableList(),
        featuresTypesOverview: features.groupSetsBy((feature) => feature.type).map(
              (featureType, featureTypesData) => MapEntry(
                featureType,
                featureTypesData.length,
              ),
            ),
        featuresTypesProductsOverview: features
            .where(
              (feature) => feature.show && feature.product != null && feature.product!.isNotEmpty,
            )
            .groupSetsBy((feature) => feature.color)
            .map((featureColor, featureColorData) => MapEntry(
                  productDictionaryLabel[featureColor].toString(),
                  featureColorData.length,
                )),
      );
}
