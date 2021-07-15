import 'package:collection/collection.dart';

import '../../utils/product_dictionary.dart';
import 'feature.dart';

Map<String, List<Feature>> getTypesList(List<Feature> features) => Map.fromEntries(
      features
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
    );

Map<String, int> getTypesCount(List<Feature> features) => Map.fromEntries(
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
    );

Map<String, int> getTypesProductsCount(List<Feature> features) => Map.fromEntries(
      features
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
    );
