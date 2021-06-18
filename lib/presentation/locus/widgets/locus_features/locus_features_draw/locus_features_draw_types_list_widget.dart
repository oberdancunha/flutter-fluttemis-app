import 'package:flutter/material.dart';

import '../../../../../domain/locus/feature.dart';

class LocusFeaturesDrawTypesListWidget extends StatelessWidget {
  final Map<String, List<Feature>> featuresTypes;

  const LocusFeaturesDrawTypesListWidget({
    required this.featuresTypes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nextLine = -25.0;

    return Stack(
      children: [
        for (var featuresType in featuresTypes.keys)
          Positioned(
            top: double.tryParse((nextLine += 40).toString()),
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              '$featuresType (${featuresTypes[featuresType]!.length})',
              style: const TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }
}
