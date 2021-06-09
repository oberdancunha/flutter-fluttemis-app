import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import '../draw/draw_locus_scale.dart';
import 'locus_features_widget.dart';

class LocusScaleWidget extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
        builder: (context, state) {
          final screenWidth = MediaQuery.of(context).size.width;
          final locusLength = state.locusShowed.length;
          final maxCharacterToMarker = locusLength.toString().length;
          const minPixelsPerCharacter = 10;
          var pixelsPerCharacter = ((locusLength / screenWidth) / maxCharacterToMarker).round();
          if (pixelsPerCharacter < minPixelsPerCharacter) {
            pixelsPerCharacter = minPixelsPerCharacter;
          }
          final maxWidthPerMarker = pixelsPerCharacter * maxCharacterToMarker;
          final markingPoints = (locusLength / maxWidthPerMarker).round();
          final scale = (screenWidth / locusLength) * (pixelsPerCharacter / 3);
          final screenWidthScale = locusLength * scale;

          return Container(
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                showTrackOnHover: true,
                interactive: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: SizedBox(
                    width: screenWidthScale + 16,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomPaint(
                        painter: DrawLocusScale(
                          width: double.tryParse(screenWidthScale.toString())!,
                          locusLength: locusLength,
                          scale: scale,
                          markingPoints: markingPoints,
                        ),
                        child: LocusFeaturesWidget(
                          screenWidthScale: screenWidthScale,
                          scale: scale,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
