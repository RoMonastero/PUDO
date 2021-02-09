import 'package:flutter_gofast/app/views/pages/scanner/scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResultProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ResultProductController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => ResultProductScreen(),
        ),
      ];

  static Inject get to => Inject<ResultProductModule>.of();
}

class ResultProductController {}
