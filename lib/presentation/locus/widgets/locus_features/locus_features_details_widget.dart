import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/locus/locus_bloc.dart';
import '../../../core/templates/container_box_details_template.dart';

class LocusFeaturesDetailsWidget extends StatefulWidget {
  const LocusFeaturesDetailsWidget({Key? key}) : super(key: key);

  @override
  _LocusFeaturesDetailsWidgetState createState() => _LocusFeaturesDetailsWidgetState();
}

class _LocusFeaturesDetailsWidgetState extends State<LocusFeaturesDetailsWidget> {
  late dynamic _copiedValue = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 10;
    const height = 200.0;
    const minimalInternalBoxWidth = 580.0;

    return BlocBuilder<LocusBloc, LocusState>(
      buildWhen: (oldState, newState) => oldState.locusFeatureShowed != newState.locusFeatureShowed,
      builder: (context, state) => state.locusFeatureShowed!.id != ''
          ? ContainerBoxDetailsTemplate(
              key: ObjectKey(state.locusFeatureShowed),
              width: width,
              internalBoxWidth: width - 35,
              minimalInternalBoxWidth: minimalInternalBoxWidth,
              internalBoxHeight: height,
              boxShadowColor: state.locusFeatureShowed!.color,
              border: Border.all(
                color: state.locusFeatureShowed!.color,
              ),
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
                  if (state.locusFeatureShowed!.aminoacids != null)
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
                  if (state.locusFeatureShowed!.nucleotides != null)
                    _printFeatureDetailWithCopyButton(
                      width: width,
                      label: 'Nucleotides',
                      value: state.locusFeatureShowed!.nucleotides,
                    ),
                  if (state.locusFeatureShowed!.aminoacids != null)
                    _printFeatureDetailWithCopyButton(
                      width: width,
                      label: 'Aminoacids',
                      value: state.locusFeatureShowed!.aminoacids,
                    ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

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

  Widget _printFeatureDetailWithCopyButton({
    required double width,
    required String label,
    required value,
  }) {
    final isValueCopied = _copiedValue == value;

    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: width - 75,
          ),
          child: ClipRRect(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _printFeatureDetail(
                label: label,
                value: value,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          height: 20,
          width: 20,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 20,
            icon: const Icon(Icons.copy),
            tooltip: isValueCopied ? 'Copied' : 'Copy',
            color: isValueCopied ? Colors.grey : Colors.black,
            onPressed: () async {
              setState(() {
                _copiedValue = value;
              });
              Clipboard.setData(ClipboardData(text: value.toString()));
            },
          ),
        ),
      ],
    );
  }
}
