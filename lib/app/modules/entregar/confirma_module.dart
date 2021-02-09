import 'package:flutter_modular/flutter_modular.dart';
import '../../views/pages/entregar/confirma_page.dart';

class ConfirmaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ConfirmaController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => Confirma(),
        ),
      ];

  static Inject get to => Inject<ConfirmaModule>.of();
}

class ConfirmaController {}
