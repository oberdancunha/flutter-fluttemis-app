import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class DrawLocusFeature extends CustomPainter {
  final double screenWidthScale;
  final BuildContext context;
  final KtList<Feature> features;
  final double scale;
  final LocusBloc locusBloc;
  final LocusState locusState;

  DrawLocusFeature({
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
        final featureStart = feature.start * scale;
        final featureEnd = feature.end * scale;
        final isFeatureSelected = feature.id == locusState.locusFeatureShowed!.id;
        var paint = Paint()..color = feature.color;
        var adjustArrow = 1;
        Function(TapUpDetails) tapAction;
        if (isFeatureSelected) {
          paint = paint
            ..strokeWidth = 4
            ..style = PaintingStyle.stroke;
          adjustArrow = 0;
          tapAction = (_) {
            locusBloc.add(LocusEvent.showLocusFeature(locusFeature: Feature.empty()));
          };
        } else {
          tapAction = (_) {
            locusBloc.add(LocusEvent.showLocusFeature(locusFeature: feature));
          };
        }
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

  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double left,
    required double top,
    required double right,
    required double bottom,
    required Function(TapUpDetails) tapAction,
  }) {
    final borderRadius = BorderRadius.circular(5);
    final rect = Rect.fromLTRB(left, top, right, bottom);
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
    required double leftOrRightPosition,
    required double topOrBottomPosition,
    required int strand,
    required Function(TapUpDetails) tapAction,
  }) {
    final path = Path();
    const radius = 8.0;
    const sides = 3.0;
    const angle = (math.pi * 2) / sides;
    final radians = strand == 0 ? 0.0 : 20.0;
    final center = Offset(leftOrRightPosition, topOrBottomPosition);
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