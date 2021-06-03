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
          final scaleByLocusLengthCharacters = locusLength.toString().length / 2;
          final scale = (screenSize / locusLength) * scaleByLocusLengthCharacters;
          final normalizeScale = 5 * (pow(10, scaleByLocusLengthCharacters)).round();
          final screenWidthScale = locusLength * scale;
          final locusLengthScale = (locusLength * scale).floor();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: screenWidthScale,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: PainterLocusScale(
                      drawType: 'line',
                      width: double.tryParse(locusLengthScale.toString())!,
                      locusLength: locusLength,
                    ),
                  ),
                  for (int markerScale = normalizeScale;
                      markerScale < (state.locusShowed.length - normalizeScale);
                      markerScale += normalizeScale)
                    CustomPaint(
                      painter: PainterLocusScale(
                        drawType: 'marker',
                        width: 30,
                        locusLength: markerScale,
                        scale: scale,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
}

class PainterLocusScale extends CustomPainter {
  final String drawType;
  final double width;
  final int locusLength;
  final double? scale;

  PainterLocusScale({
    required this.drawType,
    required this.width,
    required this.locusLength,
    this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    if (drawType == 'line') {
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
    } else if (drawType == 'marker') {
      final marker = double.tryParse(locusLength.toString());
      final markerScale = marker! * scale!;
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
