import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

import '../../../../../application/locus/locus_bloc.dart';
import '../../../../../domain/locus/feature.dart';
import '../../../draw/draw_locus_features.dart';

class LocusFeaturesDrawWidget extends StatelessWidget {
  final List<List<Feature>> featuresTypes;
  final double screenWidthScale;
  final double scale;
  final LocusState locusState;
  final int nextLinePosition;

  const LocusFeaturesDrawWidget({
    required this.featuresTypes,
    required this.screenWidthScale,
    required this.scale,
    required this.locusState,
    required this.nextLinePosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nextLine = -20.0;

    return Stack(
      children: [
        for (var features in featuresTypes)
          Positioned(
            top: double.tryParse((nextLine += nextLinePosition).toString()),
            bottom: 0,
            left: 0,
            right: 0,
            child: CanvasTouchDetector(
              builder: (context) => CustomPaint(
                painter: DrawLocusFeatures(
                  screenWidthScale: screenWidthScale,
                  context: context,
                  features: features,
                  scale: scale,
                  locusBloc: context.read<LocusBloc>(),
                  locusState: locusState,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
