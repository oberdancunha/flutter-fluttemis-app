import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/locus/locus_bloc.dart';
import 'widgets/locus_features_details_widget.dart';
import 'widgets/locus_header_widget.dart';
import 'widgets/locus_scale_widget.dart';

class LocusPage extends StatelessWidget {
  final LocusBloc locusBloc;

  const LocusPage({
    required this.locusBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locusBloc..add(const LocusEvent.getLocus())),
        ],
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange.shade100,
                  Colors.blue.shade100,
                ],
              ),
            ),
            child: BlocBuilder<LocusBloc, LocusState>(
              buildWhen: (oldState, newState) =>
                  oldState.locusFailureOrSuccess != newState.locusFailureOrSuccess,
              builder: (context, state) => state.locusFailureOrSuccess.foldRight(
                Container(),
                (data, _) => data.fold(
                  (failure) => failure.when(
                    fileNotFound: () => const Text('File not found'),
                    fileParserError: (_) => const Text('Parser error'),
                    fileIsEmpty: () => const Text('File is empty'),
                    fileFormatIncorrect: () => const Text('File format incorrect'),
                  ),
                  (_) => state.isSearching
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            LocusHeaderWidget(),
                            const SizedBox(height: 70),
                            LocusScaleWidget(),
                            const LocusFeaturesDetails(),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      );
}
