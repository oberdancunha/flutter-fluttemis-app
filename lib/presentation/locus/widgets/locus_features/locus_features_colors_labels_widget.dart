import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

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
              _printLabel(
                backgroundColor: colorLocusFeatureKnownProduct,
                label: 'Known product',
              ),
              const SizedBox(width: 15),
              _printLabel(
                backgroundColor: colorLocusFeatureHypotheticalProduct,
                label: 'Hypothetical product',
              ),
              const SizedBox(width: 15),
              _printLabel(
                backgroundColor: colorLocusFeaturePutativeProduct,
                label: 'Putative product',
              ),
              const SizedBox(width: 15),
              _printLabel(
                backgroundColor: colorLocusFeatureUnknownProduct,
                label: 'Uncharacterized product',
              ),
            ],
          ),
        ],
      );

  Widget _printLabel({
    required Color backgroundColor,
    required String label,
  }) =>
      Column(
        children: [
          Text(
            label,
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
