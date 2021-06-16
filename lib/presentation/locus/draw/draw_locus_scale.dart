import 'package:flutter/material.dart';

class DrawLocusScale extends CustomPainter {
  final double width;
  final int locusLength;
  final double scale;
  final int markingPoints;
  final int locusLengthByCharacters;

  DrawLocusScale({
    required this.width,
    required this.locusLength,
    required this.scale,
    required this.markingPoints,
    required this.locusLengthByCharacters,
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
    const factorToAdjustAngle = 40.0;
    final rightSizeAndAngle = Offset(width, factorToAdjustAngle);
    const leftSizeAndAngle = Offset(1, factorToAdjustAngle);
    canvas.drawLine(rightSizeAndAngle, leftSizeAndAngle, paint);
    _printMarker(
      canvas: canvas,
      text: '1',
      textAlign: 1,
    );
    final factorToAjustAlign = locusLengthByCharacters * 10;
    final finalMarkerInLine = width - factorToAjustAlign;
    _printMarker(
      canvas: canvas,
      text: locusLength.toString(),
      textAlign: finalMarkerInLine,
    );
  }

  void _drawMarker(Canvas canvas, Paint paint) {
    for (int marker = markingPoints;
        marker + (markingPoints * scale) < (locusLength - markingPoints);
        marker += markingPoints) {
      const markerTopPosition = 35.0;
      const markerBottomPosition = 45.0;
      final markerScale = marker * scale;
      final markerTop = Offset(markerScale, markerTopPosition);
      final markerBottom = Offset(markerScale, markerBottomPosition);
      canvas.drawLine(markerTop, markerBottom, paint);
      _printMarker(
        canvas: canvas,
        text: marker.toString(),
        textAlign: markerScale,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void _printMarker({
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
    const textHeight = 10.0;
    TextPainter(
      text: span,
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(
        canvas,
        Offset(textAlign, textHeight),
      );
  }
}
