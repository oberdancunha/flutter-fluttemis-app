import 'package:flutter/material.dart';

class DrawLocusScale extends CustomPainter {
  final double width;
  final int locusLength;
  final double scale;
  final int markingPoints;

  DrawLocusScale({
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
        (marker + markingPoints) < (locusLength - markingPoints);
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
