import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class LocusFeatures extends StatelessWidget {
  final double scale;

  const LocusFeatures({
    required this.scale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features,
        builder: (context, state) => CustomPaint(
          painter: CustomDrawFeature(
            features: state.locusShowed.features!
                .asList()
                .where((feature) => feature.type == 'CDS')
                .toImmutableList(),
            scale: scale,
          ),
        ),
      );
}

class CustomDrawFeature extends CustomPainter {
  final KtList<Feature> features;
  final double scale;

  CustomDrawFeature({
    required this.features,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;
    features.forEach(
      (feature) {
        _drawLine(
          canvas,
          paint,
          left: feature.start * scale,
          top: 70,
          right: feature.end * scale,
          bottom: 65,
        );
        _drawArrow(
          canvas,
          paint,
          leftOrRightPosition: feature.strand == 0 ? feature.end * scale : feature.start * scale,
          topOrBottomPosition: 67,
          strand: feature.strand,
        );
      },
    );
  }

  void _drawLine(
    Canvas canvas,
    Paint paint, {
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) {
    final borderRadius = BorderRadius.circular(0);
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  void _drawArrow(
    Canvas canvas,
    Paint paint, {
    required double leftOrRightPosition,
    required double topOrBottomPosition,
    required int strand,
  }) {
    final path = Path();
    const radius = 8.0;
    final radians = strand == 0 ? 0.0 : 20.0;
    const sides = 3.0;
    final angle = (math.pi * 2) / sides;
    final center = Offset(leftOrRightPosition, topOrBottomPosition);
    final startPoint = Offset(radius * math.cos(radians), radius * math.sin(radians));
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int i = 1; i <= sides; i++) {
      final x = radius * math.cos(radians + angle * i) + center.dx;
      final y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
