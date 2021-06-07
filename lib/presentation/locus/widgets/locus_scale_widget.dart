import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import '../draw/painter_locus_scale.dart';
import 'locus_features.dart';

class LocusScaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
        builder: (context, state) {
          final screenSize = MediaQuery.of(context).size.width;
          final locusLength = state.locusShowed.length;
          final locusCharLength = locusLength.toString().length;
          final scalingFactor = 2.0 - ((locusCharLength / 2) * 0.1);
          final scaleByLocusLengthCharacters = locusCharLength / scalingFactor;
          final markingPoints = 1 * (pow(10, scaleByLocusLengthCharacters)).round();
          final scale = (screenSize / locusLength) * scaleByLocusLengthCharacters;
          final screenWidthScale = locusLength * scale;
          final locusLengthScale = (locusLength * scale).round();

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
                  painter: PainterLocusScale(
                    width: double.tryParse(locusLengthScale.toString())!,
                    locusLength: locusLength,
                    scale: scale,
                    markingPoints: markingPoints,
                  ),
                  child: LocusFeatures(
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
