import 'package:flutter/material.dart';

import '../../../../domain/locus/feature.dart';

class LocusFeaturesTypesListWidget extends StatelessWidget {
  final Map<String, List<Feature>> featuresTypes;

  const LocusFeaturesTypesListWidget({
    required this.featuresTypes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const position = 16.0;
    var nextLine = 30.0;

    return SizedBox(
      child: Stack(
        children: [
          for (var featuresType in featuresTypes.keys)
            Positioned(
              top: position + double.tryParse((nextLine += 40).toString())! - 67,
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                child: Text(
                  '$featuresType (${featuresTypes[featuresType]!.length})',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
