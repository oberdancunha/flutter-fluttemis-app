import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';

class LocusScaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
        builder: (context, state) {
          final screenSize = MediaQuery.of(context).size.width;
          final locusLength = state.locusShowed.length;
          // final locusLength = 1234567;
          final double? scalingFactor;
          if (locusLength > 0 && locusLength <= 99999) {
            scalingFactor = 2;
          } else if (locusLength > 100000 && locusLength <= 999999) {
            scalingFactor = 1.8;
          } else if (locusLength > 1000000 && locusLength <= 9999999) {
            scalingFactor = 1.7;
          } else if (locusLength > 10000000 && locusLength <= 99999999) {
            scalingFactor = 1.5;
          } else if (locusLength > 100000000 && locusLength <= 999999999) {
            scalingFactor = 1.4;
          } else {
            scalingFactor = 1;
          }
          final scaleByLocusLengthCharacters = locusLength.toString().length / scalingFactor;
          final markingPoints = 5 * (pow(10, scaleByLocusLengthCharacters)).round();
          final scale = (screenSize / locusLength) * scaleByLocusLengthCharacters;
          final screenWidthScale = locusLength * scale;
          final locusLengthScale = (locusLength * scale).round();

          debugPrint(scale.toString());
          debugPrint(scaleByLocusLengthCharacters.toString());
          debugPrint(screenWidthScale.toString());
          debugPrint(locusLengthScale.toString());
          debugPrint(markingPoints.toString());

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: screenWidthScale,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomPaint(
                painter: PainterLocusScale(
                  width: double.tryParse(locusLengthScale.toString())!,
                  locusLength: locusLength,
                  scale: scale,
                  markingPoints: markingPoints,
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
    const leftSizeAndAngle = Offset(10, 40);
    canvas.drawLine(rightSizeAndAngle, leftSizeAndAngle, paint);
    _paintCanvas(
      canvas: canvas,
      text: '1',
      textAlign: 10,
    );
    _paintCanvas(
      canvas: canvas,
      text: locusLength.toString(),
      textAlign: width - (locusLength.toString().length * 10),
    );
  }

  // 254.58
  // 83.4

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
        textAlign: markerScale - 20,
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
