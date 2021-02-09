import 'package:flutter_gofast/app/controllers/receber/receber_controller.dart';

import 'package:flutter_gofast/app/views/pages/receber/receber_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReceberModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ReceberController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => Receber(),
        ),
      ];

  static Inject get to => Inject<ReceberModule>.of();
}
