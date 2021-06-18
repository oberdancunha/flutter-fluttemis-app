import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../core/templates/container_box_template.dart';

class LocusFeaturesDetailsWidget extends StatelessWidget {
  const LocusFeaturesDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) => state.locusFeatureShowed!.id != ''
            ? ContainerBoxTemplate(
                width: MediaQuery.of(context).size.width / 2.04,
                height: 250,
                boxShadowColor: state.locusFeatureShowed!.color,
                border: Border.all(
                  color: state.locusFeatureShowed!.color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Locus feature overview',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      _printFeatureDetail(
                        label: 'Start',
                        value: state.locusFeatureShowed!.start,
                      ),
                      _printFeatureDetail(
                        label: 'End',
                        value: state.locusFeatureShowed!.end,
                      ),
                      _printFeatureDetail(
                        label: 'Strand',
                        value: state.locusFeatureShowed!.strand == 0 ? '+' : '-',
                      ),
                      _printFeatureDetail(
                        label: 'Gene',
                        value: state.locusFeatureShowed!.name ?? '.',
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _printFeatureDetail(
                          label: 'Product',
                          value: state.locusFeatureShowed!.product ?? '.',
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _printFeatureDetail(
                          label: 'Note',
                          value: state.locusFeatureShowed!.note ?? '.',
                        ),
                      ),
                      if (state.locusFeatureShowed!.aminoacids != null)
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: _printFeatureDetail(
                                label: 'Aminoácids',
                                value: state.locusFeatureShowed!.aminoacids,
                              ),
                            ),
                          ],
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      );

  Widget _printFeatureDetail({
    required String label,
    required value,
  }) {
    const fontSize = 15.0;

    return Row(
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
