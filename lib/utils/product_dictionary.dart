import 'package:flutter/material.dart';

import 'constants.dart';

Map<Color, List<String>> productDictionary = {
  colorLocusFeatureHypotheticalProduct: [
    'hypothetical',
  ],
  colorLocusFeaturePutativeProduct: [
    'putative',
    'probable',
  ],
  colorLocusFeatureUnknownProduct: [
    'unknown',
    'uncharacterized',
  ],
};

Map<Color, String> productDictionaryLabel = {
  colorLocusFeatureKnownProduct: 'Known',
  colorLocusFeatureHypotheticalProduct: 'Hypothetical',
  colorLocusFeaturePutativeProduct: 'Putative',
  colorLocusFeatureUnknownProduct: 'Uncharacterized',
  colorLocusFeatureNotProduct: 'Without',
};
