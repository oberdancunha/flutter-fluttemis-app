import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/locus/locus_bloc.dart';

class LocusFeaturesDetailsWidget extends StatelessWidget {
  const LocusFeaturesDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) =>
            oldState.locusFeatureShowed != newState.locusFeatureShowed,
        builder: (context, state) => state.locusFeatureShowed!.id != ''
            ? Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(color: state.locusFeatureShowed!.color),
                    left: BorderSide(color: state.locusFeatureShowed!.color),
                    right: BorderSide(color: state.locusFeatureShowed!.color),
                    bottom: BorderSide(color: state.locusFeatureShowed!.color),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: state.locusFeatureShowed!.color.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _printFeatureDetail(
                        label: 'Start',
                        value: state.locusFeatureShowed!.start,
                      ),
                      const SizedBox(height: 10),
                      _printFeatureDetail(
                        label: 'End',
                        value: state.locusFeatureShowed!.end,
                      ),
                      const SizedBox(height: 10),
                      _printFeatureDetail(
                        label: 'Strand',
                        value: state.locusFeatureShowed!.strand == 0 ? '+' : '-',
                      ),
                      const SizedBox(height: 10),
                      _printFeatureDetail(
                        label: 'Gene',
                        value: state.locusFeatureShowed!.name ?? 'Not assigned',
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _printFeatureDetail(
                          label: 'Product',
                          value: state.locusFeatureShowed!.product,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _printFeatureDetail(
                          label: 'Note',
                          value: state.locusFeatureShowed!.note ?? '_',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _printFeatureDetail(
                          label: 'Aminoácids',
                          value: state.locusFeatureShowed!.aminoacids,
                        ),
                      ),
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
