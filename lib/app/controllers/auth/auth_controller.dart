import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_gofast/app/interfaces/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  IAuthRepository authRepository;

  _AuthControllerBase() {
    //Pegando a interface do repositorio e passanso pro auth controller base
    authRepository = Modular.get<IAuthRepository>();
  }

  @observable
  String email = '';

  @observable
  String password = '';

  //Verifica se o email ou a senha estão nulos para habilitar o botão de login
  @computed
  bool get enableButton => email.isNotEmpty && password.isNotEmpty;

  //Define o email
  @action
  void setEmail(String email) => this.email = email;

  //Define a senha
  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginEmail() async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        throw response;
      }
    });
  }

  Future<void> doRegister() async {
    var response = await authRepository.registerEmailPassword(
      email: email,
      password: password,
    );
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }

  Future<void> doLogout() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      throw response;
    }
  }
}
