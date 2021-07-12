import 'package:flutter/material.dart';

class LocusFeaturesDrawTypesListWidget extends StatelessWidget {
  final List<String> featuresTypesLabels;
  final Map<String, int> featuresTypesOverview;
  final int nextLinePosition;

  const LocusFeaturesDrawTypesListWidget({
    required this.featuresTypesLabels,
    required this.featuresTypesOverview,
    required this.nextLinePosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nextLine = -25.0;

    return Stack(
      children: [
        for (var featureTypeLabel in featuresTypesLabels)
          Positioned(
            top: double.tryParse((nextLine += nextLinePosition).toString()),
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              !RegExp('#').hasMatch(featureTypeLabel)
                  ? '$featureTypeLabel (${featuresTypesOverview[featureTypeLabel]})'
                  : '',
              style: const TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }
}
