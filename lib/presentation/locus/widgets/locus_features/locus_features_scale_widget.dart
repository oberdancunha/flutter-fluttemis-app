import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../draw/draw_locus_scale.dart';
import 'locus_features_widget.dart';

class LocusFeaturesScaleWidget extends StatelessWidget {
  final _scrollController = ScrollController();

  LocusFeaturesScaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        builder: (context, state) {
          final screenWidth = MediaQuery.of(context).size.width;
          final locusLength = state.locusShowed.length;
          final locusLengthByCharacters = locusLength.toString().length;
          const minPixelsPerCharacter = 10;
          var pixelsPerCharacter = ((locusLength / screenWidth) / locusLengthByCharacters).round();
          if (pixelsPerCharacter < minPixelsPerCharacter) {
            pixelsPerCharacter = minPixelsPerCharacter;
          }
          final maxWidthPerMarker = pixelsPerCharacter * locusLengthByCharacters;
          final markingPoints = (locusLength / maxWidthPerMarker).round();
          final scale = (screenWidth / locusLength) * (pixelsPerCharacter / 3);
          final screenWidthScale = locusLength * scale;
          final featuresTypes = Map.fromEntries(
            state.featuresListToShow
                .asList()
                .groupListsBy(
                  (feature) => feature.type,
                )
                .entries
                .toList()
                .sorted(
                  (a, b) => b.value.length.compareTo(a.value.length),
                ),
          );
          final maxHeight = MediaQuery.of(context).size.height / 2.5;
          final height = 100 + double.tryParse((featuresTypes.keys.length * 28).toString())!;

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              final isFeatureDetailsToBeHide = scrollNotification is ScrollUpdateNotification &&
                  state.locusFeatureShowed!.id != '';
              if (isFeatureDetailsToBeHide) {
                context
                    .read<LocusBloc>()
                    .add(LocusEvent.showLocusFeature(locusFeature: Feature.empty()));
              }

              return true;
            },
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              showTrackOnHover: true,
              interactive: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: screenWidthScale,
                    height: height > maxHeight ? maxHeight : height,
                    child: CustomPaint(
                      painter: DrawLocusScale(
                        width: double.tryParse(screenWidthScale.toString())!,
                        locusLength: locusLength,
                        scale: scale,
                        markingPoints: markingPoints,
                        locusLengthByCharacters: locusLengthByCharacters,
                      ),
                      child: LocusFeaturesWidget(
                        featuresTypes: featuresTypes,
                        screenWidthScale: screenWidthScale,
                        scale: scale,
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
