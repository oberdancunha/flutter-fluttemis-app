import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';
import 'locus_select_widget.dart';

class LocusHeaderWidget extends StatelessWidget {
  const LocusHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    const width = 800.0;

    return BlocBuilder<LocusBloc, LocusState>(
      builder: (_, state) => Center(
        child: SizedBox(
          width: width,
          child: Center(
            child: Scrollbar(
              isAlwaysShown: MediaQuery.of(context).size.width < width,
              controller: _controller,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
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
                      const LocusSelectWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
