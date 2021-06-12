import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../draw/draw_locus_feature.dart';
import '../../draw/draw_locus_scale.dart';

class LocusFeaturesDrawWidget extends StatelessWidget {
  final Map<String, List<Feature>> featuresTypes;
  final double screenWidthScale;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;

  const LocusFeaturesDrawWidget({
    required this.featuresTypes,
    required this.screenWidthScale,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features ||
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) {
          final locusLength = state.locusShowed.length;
          final maxWidthPerMarker = pixelsPerCharacter * locusLengthByCharacters;
          final markingPoints = (locusLength / maxWidthPerMarker).round();

          return CustomPaint(
            painter: DrawLocusScale(
              width: double.tryParse(screenWidthScale.toString())!,
              locusLength: locusLength,
              scale: scale,
              markingPoints: markingPoints,
              locusLengthByCharacters: locusLengthByCharacters,
            ),
            child: CanvasTouchDetector(
              builder: (context) => CustomPaint(
                painter: DrawLocusFeature(
                  screenWidthScale: screenWidthScale,
                  context: context,
                  featuresTypes: featuresTypes,
                  scale: scale,
                  locusBloc: context.read<LocusBloc>(),
                  locusState: state,
                ),
              ),
            ),
          );
        },
      );
}
