import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:touchable/touchable.dart';

import '../../../domain/locus/feature.dart';

class CustomDrawFeature extends CustomPainter {
  final double screenWidthScale;
  final BuildContext context;
  final KtList<Feature> features;
  final double scale;

  CustomDrawFeature({
    required this.screenWidthScale,
    required this.context,
    required this.features,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    features.forEach(
      (feature) {
        final featureStart = feature.start * scale;
        final featureEnd = feature.end * scale;
        final Function(TapUpDetails) tapAction = (_) {};
        _drawLine(
          touchyCanvas,
          paint,
          left: feature.strand == 0 ? featureStart : featureStart + 12,
          top: 71,
          right: feature.strand == 0 ? featureEnd - 12 : featureEnd,
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
    final borderRadius = BorderRadius.circular(0);
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
    final radians = strand == 0 ? 0.0 : 20.0;
    const sides = 3.0;
    final angle = (math.pi * 2) / sides;
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
