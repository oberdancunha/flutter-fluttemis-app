import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/core/app_page.dart';
import 'presentation/locus/locus_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const AppPage(),
    ),
    ModuleRoute('/locus', module: LocusModule()),
  ];
}
