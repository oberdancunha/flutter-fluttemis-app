import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../../domain/locus/feature.dart';
import 'locus_features_draw/locus_features_draw_scale_widget.dart';
import 'locus_features_draw/locus_features_draw_types_list_widget.dart';
import 'locus_features_draw/locus_features_draw_widget.dart';
import 'locus_features_draw/misc/locus_features_draw_calculate_area.dart';
import 'locus_features_draw/misc/locus_features_draw_scroll_controllers.dart';

class LocusFeaturesScaleWidget extends StatefulWidget {
  const LocusFeaturesScaleWidget({Key? key}) : super(key: key);

  @override
  _LocusFeaturesScaleWidgetState createState() => _LocusFeaturesScaleWidgetState();
}

class _LocusFeaturesScaleWidgetState extends State<LocusFeaturesScaleWidget> {
  final _scrollControllers = LocusFeaturesDrawScrollControllers();

  @override
  void dispose() {
    _scrollControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusShowed != newState.locusShowed ||
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) {
          final calculateArea = LocusFeaturesDrawCalculateArea(
            screenWidth: MediaQuery.of(context).size.width,
            screenHeight: MediaQuery.of(context).size.height,
            locusLength: state.locusShowed.length,
            minPixelsPerCharacter: 10,
            minHeight: 100,
            featuresTypesList: state.locusShowed.featuresTypesList,
          );
          _scrollControllers.createOrSet(locus: state.locusShowed);

          return SizedBox(
            key: ObjectKey(state.locusShowed),
            height: calculateArea.height,
            width: calculateArea.screenWidthScale,
            child: Stack(
              children: [
                _drawLocusScale(state: state, calculateArea: calculateArea),
                _drawLocusFeaturesTypes(
                  context: context,
                  state: state,
                  typesHeight: calculateArea.typesHeight,
                ),
                _drawLocusFeatures(
                  context: context,
                  state: state,
                  calculateArea: calculateArea,
                ),
              ],
            ),
          );
        },
      );

  Widget _drawLocusScale({
    required LocusState state,
    required LocusFeaturesDrawCalculateArea calculateArea,
  }) =>
      Positioned(
        left: 125,
        bottom: calculateArea.height - 40,
        top: 0,
        right: 20,
        child: SingleChildScrollView(
          key: ObjectKey(state.locusShowed),
          controller: _scrollControllers.controllerScale,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: calculateArea.screenWidthScale,
            child: LocusFeaturesDrawScaleWidget(
              screenWidthScale: calculateArea.screenWidthScale,
              locusLength: state.locusShowed.length,
              scale: calculateArea.scale,
              pixelsPerCharacter: calculateArea.pixelsPerCharacter,
              locusLengthByCharacters: calculateArea.locusLengthByCharacters,
            ),
          ),
        ),
      );

  Widget _drawLocusFeaturesTypes({
    required BuildContext context,
    required LocusState state,
    required double typesHeight,
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
            controller: _scrollControllers.controllerLabels,
            child: SingleChildScrollView(
              key: ObjectKey(state.locusShowed),
              controller: _scrollControllers.controllerLabels,
              child: SizedBox(
                height: typesHeight,
                child: LocusFeaturesDrawTypesListWidget(
                  featuresTypes: state.locusShowed.featuresTypesList,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _drawLocusFeatures({
    required BuildContext context,
    required LocusState state,
    required LocusFeaturesDrawCalculateArea calculateArea,
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
            controller: _scrollControllers.controllerPosition,
            child: SingleChildScrollView(
              key: ObjectKey(state.locusShowed),
              scrollDirection: Axis.horizontal,
              controller: _scrollControllers.controllerPosition,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    key: ObjectKey(state.locusShowed),
                    controller: _scrollControllers.controllerFeatures,
                    child: SizedBox(
                      width: calculateArea.screenWidthScale,
                      height: calculateArea.typesHeight,
                      child: LocusFeaturesDrawWidget(
                        featuresTypes: state.locusShowed.featuresTypesList,
                        screenWidthScale: calculateArea.screenWidthScale,
                        scale: calculateArea.scale,
                        state: state,
                      ),
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
    required LocusState state,
    required Widget child,
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
