import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../draw/draw_locus_feature.dart';

class LocusFeaturesDrawWidget extends StatelessWidget {
  final Map<String, List<Feature>> featuresTypes;
  final double screenWidthScale;
  final double scale;

  const LocusFeaturesDrawWidget({
    required this.featuresTypes,
    required this.screenWidthScale,
    required this.scale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features ||
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) {
          const position = -7;
          var nextLine = -40.0;

          return Stack(
            children: [
              for (var featuresType in featuresTypes.keys)
                Positioned(
                  top: position + double.tryParse((nextLine += 40).toString())!,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CanvasTouchDetector(
                    builder: (context) => CustomPaint(
                      painter: DrawLocusFeature(
                        screenWidthScale: screenWidthScale,
                        context: context,
                        features: featuresTypes[featuresType]!,
                        scale: scale,
                        locusBloc: context.read<LocusBloc>(),
                        locusState: state,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      );
}
