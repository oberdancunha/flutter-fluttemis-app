import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import '../draw/draw_locus_scale.dart';
import 'locus_features_widget.dart';

class LocusScaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
        builder: (context, state) {
          final screenSize = MediaQuery.of(context).size.width;
          final locusLength = state.locusShowed.length;
          final locusLengthByCharacters = locusLength.toString().length;
          final scalingFactor =
              2.0 - ((locusLengthByCharacters / 2) * (locusLengthByCharacters / 10));
          final scaleByLocusLengthCharacters = locusLengthByCharacters / scalingFactor;
          final markingPoints = 1 * (scaleByLocusLengthCharacters * 20).round();
          final scale = (screenSize / locusLength) * scaleByLocusLengthCharacters;
          final screenWidthScale = locusLength * scale;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: screenWidthScale + 16,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CustomPaint(
                  painter: DrawLocusScale(
                    width: double.tryParse(screenWidthScale.toString())!,
                    locusLength: locusLength,
                    scale: scale,
                    markingPoints: markingPoints,
                  ),
                  child: LocusFeaturesWidget(
                    screenWidthScale: screenWidthScale,
                    scale: scale,
                  ),
                ),
              ),
            ),
          );
        },
      );
}
