import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/locus/locus_bloc.dart';

class LocusPage extends StatelessWidget {
  final LocusBloc locusBloc;

  const LocusPage({
    required this.locusBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locusBloc),
        ],
        child: const Scaffold(
          body: Text('Vamos desenhar um genoma'),
        ),
      );
}
