import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:touchable/touchable.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../domain/locus/feature.dart';

class LocusFeatures extends StatelessWidget {
  final double screenWidthScale;
  final double scale;

  const LocusFeatures({
    required this.screenWidthScale,
    required this.scale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed.features != newState.locusShowed.features,
        builder: (context, state) => CanvasTouchDetector(
          builder: (context) => CustomPaint(
            painter: CustomDrawFeature(
              screenWidthScale: screenWidthScale,
              context: context,
              features: state.locusShowed.features!
                  .asList()
                  .where((feature) => feature.type == 'CDS')
                  .toImmutableList(),
              scale: scale,
            ),
          ),
        ),
      );
}

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
    final paint = Paint()..color = Colors.green;
    features.forEach(
      (feature) {
        final Function(TapUpDetails) tapAction = (_) {
          final featureLength = feature.end * scale - feature.start * scale;
          double position = feature.start * scale + featureLength;
          if (position > screenWidthScale) {
            position = position - screenWidthScale;
          }

          debugPrint((feature.start * scale).toString());
          debugPrint((feature.end * scale).toString());
          debugPrint(featureLength.toString());
          debugPrint(screenWidthScale.toString());
          debugPrint(position.toString());
          _drawDialog(
            touchyCanvas,
            position,
          );
        };
        _drawLine(
          touchyCanvas,
          paint,
          left: feature.strand == 0 ? feature.start * scale : feature.start * scale + 8,
          top: 71,
          right: feature.strand == 0 ? feature.end * scale - 8 : feature.end * scale,
          bottom: 77,
          tapAction: tapAction,
        );
        _drawArrow(
          touchyCanvas,
          paint,
          leftOrRightPosition:
              feature.strand == 0 ? feature.end * scale - 8 : feature.start * scale + 8,
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
    final startPoint = Offset(radius * math.cos(radians), radius * math.sin(radians));
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

  void _drawDialog(
    TouchyCanvas touchyCanvas,
    double position,
  ) {
    showDialog(
      context: context,
      barrierColor: null,
      builder: (_) => Stack(
        children: [
          Positioned(
            top: 240,
            left: position,
            child: Align(
              child: Container(
                width: 150,
                height: 100,
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: TootipShapeBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TootipShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(bottom: 10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 10));
    const x = 20.0;
    const y = 15.0;
    const r = 1.0;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(5)))
      ..moveTo(rect.topCenter.dx + x / 2, rect.topCenter.dy)
      ..relativeLineTo(-x / 2, -y * r)
      ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2, y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
