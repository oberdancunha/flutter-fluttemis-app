import 'package:flutter/material.dart';

import '../../../draw/draw_locus_scale.dart';

class LocusFeaturesDrawScaleWidget extends StatelessWidget {
  final int locusLength;
  final double screenWidthScale;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;

  const LocusFeaturesDrawScaleWidget({
    required this.screenWidthScale,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidthPerMarker = pixelsPerCharacter * locusLengthByCharacters;
    final markingPoints = (locusLength / maxWidthPerMarker).round();

    return CustomPaint(
      painter: DrawLocusScale(
        width: screenWidthScale,
        locusLength: locusLength,
        scale: scale,
        markingPoints: markingPoints,
        locusLengthByCharacters: locusLengthByCharacters,
      ),
    );
  }
}
