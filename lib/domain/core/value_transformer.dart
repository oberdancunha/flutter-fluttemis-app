import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/product_dictionary.dart';

Color colorLocusFeatureByProduct(String product) {
  if (product.isEmpty) {
    return colorLocusFeatureNotProduct;
  }
  final productColor = productDictionary.keys.firstWhere(
    (termColor) => productDictionary[termColor]!
        .where(
          (term) => product.toLowerCase().contains(term),
        )
        .isNotEmpty,
    orElse: () => colorLocusFeatureKnownProduct,
  );

  return productColor;
}

bool shouldDrawFeature(String type) =>
    type.toLowerCase() != 'source' && type.toLowerCase() != 'gene' && type.toLowerCase() != 'mrna';
