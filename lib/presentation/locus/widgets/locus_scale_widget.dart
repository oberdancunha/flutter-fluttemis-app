import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
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
              height: 100,
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
                    scale: scale,
                  ),
                ),
              ),
            ),
          );
        },
      );
}

class PainterLocusScale extends CustomPainter {
  final double width;
  final int locusLength;
  final double scale;
  final int markingPoints;

  PainterLocusScale({
    required this.width,
    required this.locusLength,
    required this.scale,
    required this.markingPoints,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    _drawLine(canvas, paint);
    _drawMarker(canvas, paint);
  }

  void _drawLine(Canvas canvas, Paint paint) {
    final rightSizeAndAngle = Offset(width, 40);
    const leftSizeAndAngle = Offset(1, 40);
    canvas.drawLine(rightSizeAndAngle, leftSizeAndAngle, paint);
    _paintCanvas(
      canvas: canvas,
      text: '1',
      textAlign: 1,
    );
    _paintCanvas(
      canvas: canvas,
      text: locusLength.toString(),
      textAlign: width - (locusLength.toString().length * 10),
    );
  }

  void _drawMarker(Canvas canvas, Paint paint) {
    for (int marker = markingPoints;
        marker < (locusLength - markingPoints);
        marker += markingPoints) {
      final markerScale = marker * scale;
      final topMarker = Offset(markerScale, 35);
      final bottomMarker = Offset(markerScale, 45);
      canvas.drawLine(topMarker, bottomMarker, paint);
      _paintCanvas(
        canvas: canvas,
        text: marker.toString(),
        textAlign: markerScale,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void _paintCanvas({
    required Canvas canvas,
    required String text,
    required double textAlign,
  }) {
    final span = TextSpan(
      style: TextStyle(
        color: Colors.blue.shade900,
        fontSize: 15,
      ),
      text: text,
    );
    TextPainter(
      text: span,
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(
        canvas,
        Offset(textAlign, 10),
      );
  }
}
