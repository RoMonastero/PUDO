import 'package:flutter_modular/flutter_modular.dart';
import '../../views/pages/entregar/confirmar_entrega.dart';

class ConfirmaEntregaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ConfirmaEntregaController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => ConfirmaEntrega(),
        ),
      ];

  static Inject get to => Inject<ConfirmaEntregaModule>.of();
}

class ConfirmaEntregaController {}
