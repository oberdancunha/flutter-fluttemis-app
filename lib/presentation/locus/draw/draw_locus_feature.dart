import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class DrawLocusFeature extends CustomPainter {
  final double screenWidthScale;
  final BuildContext context;
  final Map<String, List<Feature>> featuresTypes;
  final double scale;
  final LocusBloc locusBloc;
  final LocusState locusState;
  final minimalLengthToDrawAdjust = 12;

  DrawLocusFeature({
    required this.screenWidthScale,
    required this.context,
    required this.featuresTypes,
    required this.scale,
    required this.locusBloc,
    required this.locusState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    var nextLine = 0.0;
    const distanceToNextFeature = 40;
    for (final featureType in featuresTypes.keys) {
      final features = featuresTypes[featureType]!;
      _printFeatureType(
        canvas,
        featureType: featureType,
        featuresLength: features.length,
        verticalPosition: nextLine,
      );
      nextLine += 10;
      Function(TapUpDetails) tapAction;
      features.forEach(
        (feature) {
          var paint = Paint()..color = feature.color;
          var adjustToArrowLigature = 1;
          final isFeatureSelected = feature.id == locusState.locusFeatureShowed!.id;
          if (isFeatureSelected) {
            paint = paint
              ..strokeWidth = 3
              ..style = PaintingStyle.stroke;
            adjustToArrowLigature = 0;
            tapAction = (_) {
              locusBloc.add(LocusEvent.showLocusFeature(locusFeature: Feature.empty()));
            };
          } else {
            tapAction = (_) {
              locusBloc.add(LocusEvent.showLocusFeature(locusFeature: feature));
            };
          }
          final featureStart = feature.start * scale;
          final featureEnd = feature.end * scale;
          _drawLine(
            touchyCanvas,
            paint,
            featureStart: featureStart,
            featureEnd: featureEnd,
            featureStrand: feature.strand,
            adjustToArrowLigature: adjustToArrowLigature,
            linePosition: nextLine,
            tapAction: tapAction,
          );
          _drawArrow(
            touchyCanvas,
            paint,
            featureStart: featureStart,
            featureEnd: featureEnd,
            featureStrand: feature.strand,
            topOrBottomPosition: nextLine,
            strand: feature.strand,
            tapAction: tapAction,
          );
        },
      );
      nextLine = nextLine + distanceToNextFeature;
    }
  }

  void _printFeatureType(
    Canvas canvas, {
    required String featureType,
    required int featuresLength,
    required double verticalPosition,
  }) {
    const baseVerticalPosition = 50.0;
    final span = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
      text: '$featureType ($featuresLength)',
    );
    TextPainter(
      text: span,
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(
        canvas,
        Offset(0, verticalPosition + baseVerticalPosition),
      );
  }

  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required int featureStrand,
    required int adjustToArrowLigature,
    required double linePosition,
    required Function(TapUpDetails) tapAction,
  }) {
    final borderRadius = BorderRadius.circular(5);
    const topBasePosition = 71;
    const bottomBasePosition = 77;
    var adjustLineLengthToDraw = 12;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustLineLengthToDraw = 10;
    }
    final left = featureStrand == 0
        ? featureStart
        : featureStart + adjustLineLengthToDraw - adjustToArrowLigature;
    final right = featureStrand == 0
        ? featureEnd - adjustLineLengthToDraw + adjustToArrowLigature
        : featureEnd;
    final rect = Rect.fromLTRB(
      left,
      topBasePosition + linePosition,
      right,
      bottomBasePosition + linePosition,
    );
    final rrect = borderRadius.toRRect(rect);
    touchyCanvas.drawRRect(
      rrect,
      paint,
      onTapUp: tapAction,
    );
  }

  void _drawArrow(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required int featureStrand,
    required double topOrBottomPosition,
    required int strand,
    required Function(TapUpDetails) tapAction,
  }) {
    final path = Path();
    const radius = 8.0;
    const sides = 3.0;
    const angle = (math.pi * 2) / sides;
    final radians = strand == 0 ? 0.0 : 20.0;
    var adjustArrowLengthToDraw = 8;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustArrowLengthToDraw = 6;
    }
    const topOrBottomBasePosition = 74;
    final leftOrRightPosition = featureStrand == 0
        ? featureEnd - adjustArrowLengthToDraw
        : featureStart + adjustArrowLengthToDraw;
    final center = Offset(leftOrRightPosition, topOrBottomPosition + topOrBottomBasePosition);
    final startPoint = Offset(
      radius * math.cos(radians),
      radius * math.sin(radians),
    );
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int edge = 1; edge <= sides; edge++) {
      final x = radius * math.cos(radians + angle * edge) + center.dx;
      final y = radius * math.sin(radians + angle * edge) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    touchyCanvas.drawPath(
      path,
      paint,
      onTapUp: tapAction,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
