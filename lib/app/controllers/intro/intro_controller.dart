import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Rota para fazer o login
class IntroController {
  void doEnter() {
    Modular.to.pushReplacementNamed(RoutersConst.login);
  }
}
