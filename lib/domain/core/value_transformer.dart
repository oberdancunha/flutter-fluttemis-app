import 'package:flutter/material.dart';

import '../../utils/constants.dart';

Color colorLocusFeatureByProduct(String product) {
  product = product.toLowerCase();
  if (product.isEmpty) {
    return colorLocusFeatureNotProduct;
  } else if (product.contains('unknown') || product.contains('uncharacterized')) {
    return colorLocusFeatureUnknownProduct;
  } else if (product.contains('hypothetical')) {
    return colorLocusFeatureHypotheticalProduct;
  } else {
    return colorLocusFeatureKnownProduct;
  }
}
