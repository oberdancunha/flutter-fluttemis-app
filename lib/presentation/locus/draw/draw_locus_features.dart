import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class DrawLocusFeatures extends CustomPainter {
  final double screenWidthScale;
  final BuildContext context;
  final List<Feature> features;
  final double scale;
  final LocusBloc locusBloc;
  final LocusState locusState;
  final minimalLengthToDrawAdjust = 10;

  DrawLocusFeatures({
    required this.screenWidthScale,
    required this.context,
    required this.features,
    required this.scale,
    required this.locusBloc,
    required this.locusState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
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
        if ((featureEnd - featureStart) + 1 > minimalLengthToDrawAdjust ||
            feature.product != null) {
          _drawLine(
            touchyCanvas,
            paint,
            featureStart: featureStart,
            featureEnd: featureEnd,
            featureStrand: feature.strand,
            adjustToArrowLigature: adjustToArrowLigature,
            tapAction: tapAction,
          );
          _drawArrow(
            touchyCanvas,
            paint,
            featureStart: featureStart,
            featureEnd: featureEnd,
            featureStrand: feature.strand,
            tapAction: tapAction,
          );
        } else {
          _drawSmallFeatureWithoutProduct(
            touchyCanvas,
            paint,
            featureEnd: featureEnd,
            tapAction: tapAction,
          );
        }
      },
    );
  }

  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required int featureStrand,
    required int adjustToArrowLigature,
    required Function(TapUpDetails) tapAction,
  }) {
    final borderRadius = BorderRadius.circular(5);
    const topBasePosition = 0.0;
    const bottomBasePosition = 7.0;
    var adjustLineLengthToDraw = 12;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustLineLengthToDraw = 9;
    }
    final left = featureStrand == 0
        ? featureStart
        : featureStart + adjustLineLengthToDraw - adjustToArrowLigature;
    final right = featureStrand == 0
        ? featureEnd - adjustLineLengthToDraw + adjustToArrowLigature
        : featureEnd;
    final rect = Rect.fromLTRB(
      left,
      topBasePosition,
      right,
      bottomBasePosition,
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
    required Function(TapUpDetails) tapAction,
  }) {
    final path = Path();
    const radius = 8.0;
    const sides = 3.0;
    const angle = (math.pi * 2) / sides;
    final radians = featureStrand == 0 ? 0.0 : 20.0;
    var adjustArrowLengthToDraw = 8;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustArrowLengthToDraw = 6;
    }
    const topOrBottomBasePosition = 3.0;
    final leftOrRightPosition = featureStrand == 0
        ? featureEnd - adjustArrowLengthToDraw
        : featureStart + adjustArrowLengthToDraw;
    final center = Offset(leftOrRightPosition, topOrBottomBasePosition);
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

  void _drawSmallFeatureWithoutProduct(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureEnd,
    required Function(TapUpDetails) tapAction,
  }) {
    final center = Offset(featureEnd, 0);
    paint.strokeWidth = 1;
    touchyCanvas.drawLine(
      Offset(center.dx, center.dy + 7),
      Offset(center.dx, center.dy - 7),
      paint,
      onTapUp: tapAction,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
