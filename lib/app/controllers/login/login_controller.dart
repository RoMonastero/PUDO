import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController {
  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }
}
