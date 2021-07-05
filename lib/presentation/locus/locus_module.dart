import 'package:flutter_modular/flutter_modular.dart';

import '../../application/locus/locus_bloc.dart';
import '../../domain/locus/i_locus_repository.dart';
import '../../infrastructure/locus/i_locus_data_source.dart';
import '../../infrastructure/locus/locus_repository.dart';
import 'locus_page.dart';

class LocusModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ILocusDataSource>(
      (i) => i.args!.data as ILocusDataSource,
    ),
    Bind<ILocusRepository>((i) => LocusRepository(locusDataSource: i.get<ILocusDataSource>())),
    Bind<LocusBloc>(
      (i) => LocusBloc(
        locusRepository: i.get<ILocusRepository>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => LocusPage(
        locusBloc: Modular.get<LocusBloc>(),
      ),
    ),
  ];
}
