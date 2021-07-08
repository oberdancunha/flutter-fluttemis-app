import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/locus/locus_bloc.dart';
import '../core/templates/background_template.dart';
import '../core/widgets/loading_widget.dart';
import '../core/widgets/resource_error_widget.dart';
import '../core/widgets/stack_menu_widget.dart';
import 'widgets/locus_body_widget.dart';
import 'widgets/locus_features/locus_features_body_widget.dart';
import 'widgets/locus_header_widget.dart';

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
          body: BackgroundTemplate(
            child: BlocBuilder<LocusBloc, LocusState>(
              buildWhen: (oldState, newState) =>
                  oldState.locusFailureOrSuccess != newState.locusFailureOrSuccess ||
                  oldState.isSearching != newState.isSearching,
              builder: (context, state) => state.isSearching
                  ? const LoadingWidget()
                  : state.locusFailureOrSuccess.foldRight(
                      Container(),
                      (data, _) => data.fold(
                        (failure) => failure.when(
                          fileNotFound: (fileName, fileType) => ResourceErrorWidget(
                            image: 'assets/images/file_not_found.png',
                            resourceName: fileName,
                            resourceType: fileType,
                            message: 'file not found',
                          ),
                          fileParseError: (fileName, fileType, _) => ResourceErrorWidget(
                            image: 'assets/images/file_unexpected_error.png',
                            resourceName: fileName,
                            resourceType: fileType,
                            message: 'file had an unexpected error',
                          ),
                          fileEmpty: (fileName, fileType) => ResourceErrorWidget(
                            image: 'assets/images/file_empty.png',
                            resourceName: fileName,
                            resourceType: fileType,
                            message: 'file is empty',
                          ),
                          fileFormatIncorrect: (fileName, fileType) => ResourceErrorWidget(
                            image: 'assets/images/file_format_error.png',
                            resourceName: fileName,
                            resourceType: fileType,
                            message: 'file format is incorrect',
                          ),
                        ),
                        (_) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: StackMenuWidget(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    LocusHeaderWidget(),
                                    SizedBox(height: 5),
                                    LocusFeaturesBodyWidget(),
                                    SizedBox(height: 5),
                                    LocusBodyWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      );
}
