import 'package:flutter_gofast/app/controllers/entregar/entregar_controler.dart';
import '../../views/pages/entregar/entregar_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EntregarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => EntregarController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => Entregar(),
        ),
      ];

  static Inject get to => Inject<EntregarModule>.of();
}
