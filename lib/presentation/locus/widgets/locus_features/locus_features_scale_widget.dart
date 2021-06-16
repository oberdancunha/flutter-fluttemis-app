import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../widgets/locus_features/locus_features_types_list_widget.dart';
import 'locus_features_draw_scale_widget.dart';
import 'locus_features_draw_widget.dart';

class LocusFeaturesScaleWidget extends StatelessWidget {
  const LocusFeaturesScaleWidget({Key? key}) : super(key: key);

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
          const minHeight = 100.0;
          final maxHeight = MediaQuery.of(context).size.height / 3;
          final typesHeight = double.tryParse((featuresTypes.keys.length * 40).toString())!;
          final totalTypesHeight = double.tryParse((featuresTypes.keys.length * 55).toString())!;
          final height = totalTypesHeight >= maxHeight
              ? maxHeight
              : totalTypesHeight >= minHeight
                  ? totalTypesHeight
                  : minHeight;

          final _controllersScalePosition = LinkedScrollControllerGroup();
          final _controllersLabelsFeatures = LinkedScrollControllerGroup();
          final _controllerScale = _controllersScalePosition.addAndGet();
          final _controllerPosition = _controllersScalePosition.addAndGet();
          final _controllerLabels = _controllersLabelsFeatures.addAndGet();
          final _controllerFeatures = _controllersLabelsFeatures.addAndGet();

          final _positionsKey = Key('position_${state.locusShowed.name}_${DateTime.now()}');
          final _typesKey = Key('types_${state.locusShowed.name}_${DateTime.now()}');

          return SizedBox(
            height: height,
            width: screenWidthScale,
            child: Stack(
              children: [
                _buildLocusScale(
                  screenWidthScale: screenWidthScale,
                  height: height,
                  locusLength: locusLength,
                  scale: scale,
                  pixelsPerCharacter: pixelsPerCharacter,
                  locusLengthByCharacters: locusLengthByCharacters,
                  positionsKey: _positionsKey,
                  controllerScale: _controllerScale,
                ),
                _buildLocusFeaturesTypes(
                  context: context,
                  featuresTypes: featuresTypes,
                  typesHeight: typesHeight,
                  state: state,
                  typesKey: _typesKey,
                  controllerLabels: _controllerLabels,
                ),
                _buildLocusFeatures(
                  context: context,
                  state: state,
                  screenWidthScale: screenWidthScale,
                  typesHeight: typesHeight,
                  featuresTypes: featuresTypes,
                  scale: scale,
                  positionsKey: _positionsKey,
                  typesKey: _typesKey,
                  controllerFeatures: _controllerFeatures,
                  controllerPosition: _controllerPosition,
                ),
              ],
            ),
          );
        },
      );

  Widget _buildLocusScale({
    required double screenWidthScale,
    required double height,
    required int locusLength,
    required double scale,
    required int pixelsPerCharacter,
    required int locusLengthByCharacters,
    required Key positionsKey,
    required ScrollController controllerScale,
  }) =>
      Positioned(
        left: 125,
        bottom: height - 40,
        top: 0,
        right: 20,
        child: SingleChildScrollView(
          key: positionsKey,
          controller: controllerScale,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: screenWidthScale,
            child: LocusFeaturesDrawScaleWidget(
              screenWidthScale: screenWidthScale,
              locusLength: locusLength,
              scale: scale,
              pixelsPerCharacter: pixelsPerCharacter,
              locusLengthByCharacters: locusLengthByCharacters,
            ),
          ),
        ),
      );

  Widget _buildLocusFeaturesTypes({
    required BuildContext context,
    required Map<String, List<Feature>> featuresTypes,
    required double typesHeight,
    required LocusState state,
    required Key typesKey,
    required ScrollController controllerLabels,
  }) =>
      Positioned(
        left: 0,
        bottom: 20,
        top: 40,
        right: 0,
        child: _hideFeatureDetailsShown(
          context: context,
          state: state,
          child: Scrollbar(
            key: typesKey,
            isAlwaysShown: true,
            controller: controllerLabels,
            child: SingleChildScrollView(
              key: typesKey,
              controller: controllerLabels,
              child: SizedBox(
                height: typesHeight + 0.1,
                child: LocusFeaturesTypesListWidget(featuresTypes: featuresTypes),
              ),
            ),
          ),
        ),
      );

  Widget _buildLocusFeatures({
    required BuildContext context,
    required LocusState state,
    required double screenWidthScale,
    required double typesHeight,
    required Map<String, List<Feature>> featuresTypes,
    required double scale,
    required Key positionsKey,
    required Key typesKey,
    required ScrollController controllerPosition,
    required ScrollController controllerFeatures,
  }) =>
      Positioned(
        left: 125,
        bottom: 0,
        top: 40,
        right: 20,
        child: _hideFeatureDetailsShown(
          context: context,
          state: state,
          child: Scrollbar(
            key: positionsKey,
            isAlwaysShown: true,
            interactive: true,
            controller: controllerPosition,
            child: SingleChildScrollView(
              key: positionsKey,
              scrollDirection: Axis.horizontal,
              controller: controllerPosition,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SingleChildScrollView(
                  key: typesKey,
                  controller: controllerFeatures,
                  child: SizedBox(
                    width: screenWidthScale,
                    height: typesHeight + 0.1,
                    child: LocusFeaturesDrawWidget(
                      featuresTypes: featuresTypes,
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

  Widget _hideFeatureDetailsShown({
    required BuildContext context,
    required Widget child,
    required LocusState state,
  }) =>
      NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          final isFeatureDetailsToBeHide =
              scrollNotification is ScrollUpdateNotification && state.locusFeatureShowed!.id != '';
          if (isFeatureDetailsToBeHide) {
            context
                .read<LocusBloc>()
                .add(LocusEvent.showLocusFeature(locusFeature: Feature.empty()));
          }

          return true;
        },
        child: child,
      );
}
