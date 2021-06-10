import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';

class LocusDetailsWidget extends StatelessWidget {
  const LocusDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (oldState, newState) => oldState.locusShowed != newState.locusShowed,
        builder: (context, state) => Container(
          width: MediaQuery.of(context).size.width / 2 - 25,
          height: 300,
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
            child: Column(
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
                  children: [
                    _buildOverview(label: 'Length', value: state.locusShowed.length),
                    const SizedBox(width: 20),
                    _buildOverview(label: 'Type', value: state.locusShowed.type),
                    const SizedBox(width: 20),
                    _buildOverview(label: 'Shape', value: state.locusShowed.shape),
                    const SizedBox(width: 20),
                    _buildOverview(label: 'Release', value: state.locusShowed.releaseDate),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildOverview({
    required String label,
    required value,
  }) {
    const fontSize = 15.0;

    return Row(
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: fontSize),
        )
      ],
    );
  }
}
