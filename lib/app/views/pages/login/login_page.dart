import 'package:flutter_gofast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gofast/app/controllers/login/login_controller.dart';

import 'package:flutter_gofast/app/views/widgets/scroll_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

//Pagina de login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
      ),
      body: ScrollWidget(
        children: <Widget>[
          Image.asset('assets/images/logo-limelocker.png'),
          SizedBox(
            height: 8,
          ),
          TextField(
            onChanged: _authController.setEmail,
            decoration: InputDecoration(hintText: "Seu email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextField(
            onChanged: _authController.setPassword,
            decoration: InputDecoration(hintText: "Sua senha"),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          Observer(
              name: 'LoginButton',
              builder: (context) {
                return RaisedButton(
                  //SO libera o botão apos ter algo no campo email e senha
                  onPressed: _authController.enableButton
                      ? () async {
                          await _authController.doLoginEmail().catchError(
                            (error) {
                              var scnackbar = SnackBar(
                                content: Text(error.message),
                              );
                              Scaffold.of(context).showSnackBar(scnackbar);
                            },
                          );
                        }
                      : null,
                  child: Text(
                    "ENTRAR",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
          SizedBox(
            height: _height * 0.04,
          ),
          RaisedButton(
            color: Colors.green[500],
            onPressed: controller.doRegister,
            child: Text(
              "REGISTRAR-SE",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
