import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../draw/draw_locus_feature.dart';

class LocusFeaturesWidget extends StatelessWidget {
  final double screenWidthScale;
  final double scale;

  const LocusFeaturesWidget({
    required this.screenWidthScale,
    required this.scale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features ||
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) => CanvasTouchDetector(
          builder: (context) => CustomPaint(
            painter: DrawLocusFeature(
              screenWidthScale: screenWidthScale,
              context: context,
              features: state.featuresListToShow,
              scale: scale,
              locusBloc: context.read<LocusBloc>(),
              locusState: state,
            ),
          ),
        ),
      );
}
