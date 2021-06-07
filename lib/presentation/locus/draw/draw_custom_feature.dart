import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class DrawCustomFeature extends CustomPainter {
  final double screenWidthScale;
  final BuildContext context;
  final KtList<Feature> features;
  final double scale;
  final LocusBloc locusBloc;
  final LocusState locusState;

  DrawCustomFeature({
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
    features.forEach(
      (feature) {
        var paint = Paint()..color = Colors.green;
        final featureStart = feature.start * scale;
        final featureEnd = feature.end * scale;
        var adjustArrow = 1;
        if (locusState.locusFeatureShowed != null) {
          if (feature.start == locusState.locusFeatureShowed!.start &&
              feature.end == locusState.locusFeatureShowed!.end &&
              feature.strand == locusState.locusFeatureShowed!.strand) {
            paint = paint
              ..strokeWidth = 2
              ..style = PaintingStyle.stroke;
            adjustArrow = 0;
          }
        }
        final Function(TapUpDetails) tapAction = (_) {
          locusBloc.add(LocusEvent.showLocusFeature(locusFeature: feature));
        };
        _drawLine(
          touchyCanvas,
          paint,
          left: feature.strand == 0 ? featureStart : featureStart + 12 - adjustArrow,
          top: 71,
          right: feature.strand == 0 ? featureEnd - 12 + adjustArrow : featureEnd,
          bottom: 77,
          tapAction: tapAction,
        );
        _drawArrow(
          touchyCanvas,
          paint,
          leftOrRightPosition: feature.strand == 0 ? featureEnd - 8 : featureStart + 8,
          topOrBottomPosition: 74,
          strand: feature.strand,
          tapAction: tapAction,
        );
      },
    );
  }

  // ignore: long-parameter-list
  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double left,
    required double top,
    required double right,
    required double bottom,
    required Function(TapUpDetails) tapAction,
  }) {
    final borderRadius = BorderRadius.circular(0);
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final rrect = borderRadius.toRRect(rect);
    touchyCanvas.drawRRect(
      rrect,
      paint,
      onTapUp: tapAction,
    );
  }

  // ignore: long-parameter-list
  void _drawArrow(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double leftOrRightPosition,
    required double topOrBottomPosition,
    required int strand,
    required Function(TapUpDetails) tapAction,
  }) {
    final path = Path();
    const radius = 8.0;
    final radians = strand == 0 ? 0.0 : 20.0;
    const sides = 3.0;
    const angle = (math.pi * 2) / sides;
    final center = Offset(leftOrRightPosition, topOrBottomPosition);
    final startPoint = Offset(
      radius * math.cos(radians),
      radius * math.sin(radians),
    );
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int i = 1; i <= sides; i++) {
      final x = radius * math.cos(radians + angle * i) + center.dx;
      final y = radius * math.sin(radians + angle * i) + center.dy;
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
