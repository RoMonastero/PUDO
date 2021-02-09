import 'package:flutter_gofast/app/views/pages/scanner/scanner2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScannerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ScannerController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => Scanner(),
        ),
      ];

  static Inject get to => Inject<ScannerModule>.of();
}

class ScannerController {}

class ResultProductController {}
