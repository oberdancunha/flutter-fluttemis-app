import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/product_dictionary.dart';

class LocusFeaturesColorsLabelsWidget extends StatelessWidget {
  const LocusFeaturesColorsLabelsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Product color label',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _printLabel(backgroundColor: colorLocusFeatureKnownProduct),
              const SizedBox(width: 15),
              _printLabel(backgroundColor: colorLocusFeatureHypotheticalProduct),
              const SizedBox(width: 15),
              _printLabel(backgroundColor: colorLocusFeaturePutativeProduct),
              const SizedBox(width: 15),
              _printLabel(backgroundColor: colorLocusFeatureUnknownProduct),
              const SizedBox(width: 15),
              _printLabel(backgroundColor: colorLocusFeatureNotProduct),
            ],
          ),
        ],
      );

  Widget _printLabel({required Color backgroundColor}) => Column(
        children: [
          Text(
            '${productDictionaryLabel[backgroundColor] ?? 'Not'} product',
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 5),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      );
}
