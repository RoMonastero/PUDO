import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Confirma extends StatefulWidget {
  @override
  _ConfirmaState createState() => _ConfirmaState();
}

class _ConfirmaState extends State<Confirma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmação de Entrega',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //apenas um exemplo de como deve ficar
              Image.asset('assets/images/logo-limelocker.png'),
              Text("Confirma entrega de lalala para apto lala?"),
              Text("Nome da pessoa"),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                onPressed: () {
                  Modular.to.pushNamed(RoutersConst.home);
                },
                child: Text("SALVAR"),
                color: Colors.green[800],
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text('VOLTAR'),
                onPressed: () {
                  Modular.to.pushNamed(RoutersConst.home);
                },
                color: Colors.red[700],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
