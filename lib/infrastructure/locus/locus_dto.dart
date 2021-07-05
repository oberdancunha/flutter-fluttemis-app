import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/locus/locus.dart';
import '../../utils/product_dictionary.dart';
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
        featuresTypesList: Map.fromEntries(
          features
              .map((feature) => feature.toDomain())
              .where((feature) => feature.show)
              .groupListsBy((feature) => feature.typeByOverlap)
              .entries
              .sorted(
                (aType, bType) => bType.value.length.compareTo(aType.value.length),
              )
              .sorted(
            (aType, bType) {
              final aTypeSplit = aType.key.split('#');
              final bTypeSplit = bType.key.split('#');
              final aTypeName = aTypeSplit.first.toString();
              final bTypeName = bTypeSplit.first.toString();
              final compareTypesNames = aTypeName.compareTo(bTypeName);
              if (compareTypesNames == 0) {
                final aTypePosition = int.tryParse(aTypeSplit.last.toString()) ?? 0;
                final bTypePosition = int.tryParse(bTypeSplit.last.toString()) ?? 0;

                return aTypePosition.compareTo(bTypePosition);
              }

              return compareTypesNames;
            },
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
                (aType, bType) => bType.value.compareTo(aType.value),
              ),
        ),
        featuresTypesProductsOverview: Map.fromEntries(
          features
              .map((feature) => feature.toDomain())
              .where((feature) => feature.show)
              .groupSetsBy((feature) => feature.color)
              .map(
                (featureColor, featureColorData) => MapEntry(
                  productDictionaryLabel[featureColor].toString(),
                  featureColorData.length,
                ),
              )
              .entries
              .sorted(
                (aTypeProduct, bTypeProduct) => bTypeProduct.value.compareTo(aTypeProduct.value),
              ),
        ),
      );
}
