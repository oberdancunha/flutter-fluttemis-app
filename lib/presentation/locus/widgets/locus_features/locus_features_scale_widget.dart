import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../widgets/locus_features/locus_features_types_list_widget.dart';
import 'locus_features_draw_scale.dart';
import 'locus_features_draw_widget.dart';

class LocusFeaturesScaleWidget extends StatefulWidget {
  const LocusFeaturesScaleWidget({Key? key}) : super(key: key);

  @override
  _LocusFeaturesScaleWidgetState createState() => _LocusFeaturesScaleWidgetState();
}

class _LocusFeaturesScaleWidgetState extends State<LocusFeaturesScaleWidget> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _controllerScale;
  late ScrollController _controllerPosition;
  late ScrollController _controllerLabel;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _controllerScale = _controllers.addAndGet();
    _controllerPosition = _controllers.addAndGet();
    _controllerLabel = ScrollController();
  }

  @override
  void dispose() {
    _controllerScale.dispose();
    _controllerPosition.dispose();
    _controllerLabel.dispose();
    super.dispose();
  }

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
          const minHeight = 80.0;
          final maxHeight = MediaQuery.of(context).size.height / 3;
          final labelTypesHeight = double.tryParse((featuresTypes.keys.length * 40).toString())!;
          final height = double.tryParse((featuresTypes.keys.length * 50).toString())!;

          return SizedBox(
            height: height > maxHeight
                ? maxHeight
                : height > minHeight
                    ? height
                    : minHeight,
            width: screenWidthScale,
            child: Stack(
              children: [
                _buildLocusScale(
                  screenWidthScale: screenWidthScale,
                  height: height > maxHeight ? maxHeight : height,
                  locusLength: locusLength,
                  scale: scale,
                  pixelsPerCharacter: pixelsPerCharacter,
                  locusLengthByCharacters: locusLengthByCharacters,
                ),
                _buildLabelsAndFeatures(
                  labelTypesHeight: labelTypesHeight,
                  state: state,
                  screenWidthScale: screenWidthScale,
                  featuresTypes: featuresTypes,
                  scale: scale,
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
  }) =>
      Positioned(
        left: 120,
        bottom: height - 40,
        top: 0,
        right: 0,
        child: SingleChildScrollView(
          controller: _controllerScale,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: screenWidthScale,
            child: LocusFeaturesDrawScale(
              screenWidthScale: screenWidthScale,
              locusLength: locusLength,
              scale: scale,
              pixelsPerCharacter: pixelsPerCharacter,
              locusLengthByCharacters: locusLengthByCharacters,
            ),
          ),
        ),
      );

  Widget _buildLabelsAndFeatures({
    required double labelTypesHeight,
    required LocusState state,
    required double screenWidthScale,
    required Map<String, List<Feature>> featuresTypes,
    required double scale,
  }) =>
      Positioned(
        left: 0,
        bottom: 0,
        top: 40,
        right: 0,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _controllerLabel,
          showTrackOnHover: true,
          interactive: true,
          child: NotificationListener<ScrollNotification>(
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
            child: SingleChildScrollView(
              controller: _controllerLabel,
              child: SizedBox(
                height: labelTypesHeight,
                child: Stack(
                  children: [
                    _buildLocusFeaturesTypes(featuresTypes: featuresTypes),
                    _buildLocusFeatures(
                      state: state,
                      screenWidthScale: screenWidthScale,
                      featuresTypes: featuresTypes,
                      scale: scale,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildLocusFeaturesTypes({
    required Map<String, List<Feature>> featuresTypes,
  }) =>
      Positioned(
        left: 0,
        bottom: 0,
        top: 0,
        right: 0,
        child: LocusFeaturesTypesListWidget(featuresTypes: featuresTypes),
      );

  Widget _buildLocusFeatures({
    required LocusState state,
    required double screenWidthScale,
    required Map<String, List<Feature>> featuresTypes,
    required double scale,
  }) =>
      Positioned(
        left: 120,
        bottom: 0,
        top: 0,
        right: 0,
        child: NotificationListener<ScrollNotification>(
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _controllerPosition,
            child: SizedBox(
              width: screenWidthScale,
              child: LocusFeaturesDrawWidget(
                featuresTypes: featuresTypes,
                screenWidthScale: screenWidthScale,
                scale: scale,
              ),
            ),
          ),
        ),
      );
}
