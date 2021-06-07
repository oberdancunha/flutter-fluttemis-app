import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../draw/custom_draw_feature.dart';

class LocusFeatures extends StatelessWidget {
  final double screenWidthScale;
  final double scale;

  const LocusFeatures({
    required this.screenWidthScale,
    required this.scale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features,
        builder: (context, state) => CanvasTouchDetector(
          builder: (context) => CustomPaint(
            painter: CustomDrawFeature(
              screenWidthScale: screenWidthScale,
              context: context,
              features: state.locusShowed.features!
                  .asList()
                  .where((feature) => feature.type == 'CDS')
                  .toImmutableList(),
              scale: scale,
            ),
          ),
        ),
      );
}
