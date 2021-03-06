import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import '../../../utils/product_dictionary.dart';
import '../../core/templates/container_box_details_template.dart';
import '../../core/templates/container_box_template.dart';

class LocusDetailsWidget extends StatelessWidget {
  const LocusDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 10;
    const minimalInternalBoxWidth = 580.0;

    return BlocBuilder<LocusBloc, LocusState>(
      buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
      builder: (context, state) => ContainerBoxDetailsTemplate(
        key: ObjectKey(state.locusShowed),
        width: width,
        internalBoxWidth: width - 30,
        minimalInternalBoxWidth: minimalInternalBoxWidth,
        internalBoxHeight: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Locus overview',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOverview(label: 'Length', value: state.locusShowed.length),
                _buildOverview(label: 'Features', value: state.locusShowed.features.size),
                _buildOverview(label: 'Type', value: state.locusShowed.type),
                _buildOverview(label: 'Shape', value: state.locusShowed.shape),
                _buildOverview(label: 'Release', value: state.locusShowed.releaseDate),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    _buildOverview(
                      label: 'Features types',
                      value: state.locusShowed.featuresReport.featuresTypesCount.length,
                    ),
                    const SizedBox(height: 10),
                    _buildFeaturesList(
                      context: context,
                      featuresList: state.locusShowed.featuresReport.featuresTypesCount,
                      colorText: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    _buildOverview(
                      label: 'Products types',
                      value: state.locusShowed.featuresReport.featuresTypesProductsCount.length,
                    ),
                    const SizedBox(height: 10),
                    _buildFeaturesList(
                      context: context,
                      featuresList: state.locusShowed.featuresReport.featuresTypesProductsCount,
                      colorText: true,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview({
    required String label,
    required value,
    Color textColor = Colors.black,
    double fontSize = 15.0,
  }) =>
      Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      );

  Widget _buildFeaturesList({
    required BuildContext context,
    required Map<String, int> featuresList,
    required bool colorText,
  }) {
    final scrollController = ScrollController();

    return ContainerBoxTemplate(
      constraints: const BoxConstraints(
        maxHeight: 100,
        minWidth: 150,
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String featureType in featuresList.keys)
                  _buildOverview(
                    label: featureType,
                    value: featuresList[featureType],
                    fontSize: 13,
                    textColor: colorText
                        ? productDictionaryLabel.keys.firstWhere(
                            (color) => productDictionaryLabel[color] == featureType,
                          )
                        : Colors.black,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
