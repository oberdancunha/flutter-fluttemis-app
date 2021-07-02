import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../utils/product_dictionary.dart';
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
        featuresToShow: features
            .map((feature) => feature.toDomain())
            .where((feature) => feature.show)
            .toImmutableList(),
        featuresTypesList: Map.fromEntries(
          features
              .map((feature) => feature.toDomain())
              .where((feature) => feature.show)
              .groupListsBy((feature) => feature.type)
              .entries
              .sorted(
                (a, b) => b.value.length.compareTo(a.value.length),
              ),
        ),
        featuresTypesOverview: Map.fromEntries(
          features
              .groupSetsBy((feature) => feature.type)
              .map(
                (featureType, featureTypesData) => MapEntry(
                  featureType,
                  featureTypesData.length,
                ),
              )
              .entries
              .sorted(
                (a, b) => b.value.compareTo(a.value),
              ),
        ),
        featuresTypesProductsOverview: Map.fromEntries(
          features
              .map((feature) => feature.toDomain())
              .where((feature) => feature.show)
              .groupSetsBy((feature) => feature.color)
              .map((featureColor, featureColorData) => MapEntry(
                    productDictionaryLabel[featureColor].toString(),
                    featureColorData.length,
                  ))
              .entries
              .sorted(
                (a, b) => b.value.compareTo(a.value),
              ),
        ),
      );
}
