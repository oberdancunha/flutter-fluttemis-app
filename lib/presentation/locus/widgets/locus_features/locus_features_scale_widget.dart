import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import '../../../../domain/locus/locus.dart';
import 'locus_features_draw_scale_widget.dart';
import 'locus_features_draw_widget.dart';
import 'locus_features_types_list_widget.dart';

class LocusFeaturesScaleWidget extends StatefulWidget {
  const LocusFeaturesScaleWidget({Key? key}) : super(key: key);

  @override
  _LocusFeaturesScaleWidgetState createState() => _LocusFeaturesScaleWidgetState();
}

class _LocusFeaturesScaleWidgetState extends State<LocusFeaturesScaleWidget> {
  late Map<Locus, List<ScrollController>> _mapControllers = {};
  late ScrollController _controllerScale;
  late ScrollController _controllerPosition;
  late ScrollController _controllerLabels;
  late ScrollController _controllerFeatures;

  @override
  void dispose() {
    _controllerScale.dispose();
    _controllerPosition.dispose();
    _controllerLabels.dispose();
    _controllerFeatures.dispose();
    _mapControllers.forEach(
      (key, controllers) => controllers.map(
        (controller) => controller.dispose(),
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed != newState.locusShowed ||
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
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
          _setScrollControllers(locus: state.locusShowed);

          return SizedBox(
            key: ObjectKey(state.locusShowed),
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
                  state: state,
                ),
                _buildLocusFeaturesTypes(
                  context: context,
                  featuresTypes: featuresTypes,
                  typesHeight: typesHeight,
                  state: state,
                ),
                _buildLocusFeatures(
                  context: context,
                  state: state,
                  screenWidthScale: screenWidthScale,
                  typesHeight: typesHeight,
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
    required LocusState state,
  }) =>
      Positioned(
        left: 125,
        bottom: height - 40,
        top: 0,
        right: 20,
        child: SingleChildScrollView(
          key: ObjectKey(state.locusShowed),
          controller: _controllerScale,
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
            key: ObjectKey(state.locusShowed),
            isAlwaysShown: true,
            controller: _controllerLabels,
            child: SingleChildScrollView(
              key: ObjectKey(state.locusShowed),
              controller: _controllerLabels,
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
            key: ObjectKey(state.locusShowed),
            isAlwaysShown: true,
            interactive: true,
            controller: _controllerPosition,
            child: SingleChildScrollView(
              key: ObjectKey(state.locusShowed),
              scrollDirection: Axis.horizontal,
              controller: _controllerPosition,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SingleChildScrollView(
                  key: ObjectKey(state.locusShowed),
                  controller: _controllerFeatures,
                  child: SizedBox(
                    width: screenWidthScale,
                    height: typesHeight + 0.1,
                    child: LocusFeaturesDrawWidget(
                      featuresTypes: featuresTypes,
                      screenWidthScale: screenWidthScale,
                      scale: scale,
                      state: state,
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

  void _setScrollControllers({required Locus locus}) {
    if (_mapControllers.containsKey(locus)) {
      _controllerScale = _mapControllers[locus]!.elementAt(0);
      _controllerPosition = _mapControllers[locus]!.elementAt(1);
      _controllerLabels = _mapControllers[locus]!.elementAt(2);
      _controllerFeatures = _mapControllers[locus]!.elementAt(3);
    } else {
      final controllersScalePosition = LinkedScrollControllerGroup();
      _controllerScale = controllersScalePosition.addAndGet();
      _controllerPosition = controllersScalePosition.addAndGet();
      final controllersLabelsFeatures = LinkedScrollControllerGroup();
      _controllerLabels = controllersLabelsFeatures.addAndGet();
      _controllerFeatures = controllersLabelsFeatures.addAndGet();
      _mapControllers = {
        locus: [
          _controllerScale,
          _controllerPosition,
          _controllerLabels,
          _controllerFeatures,
        ],
      };
    }
  }
}
