import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import 'select_locus_widget.dart';

class LocusHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        builder: (_, state) => Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.locusShowed.organism,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 40),
              SelectLocusWidget(),
            ],
          ),
        ),
      );
}
