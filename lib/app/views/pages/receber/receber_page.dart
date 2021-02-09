import 'package:flutter_gofast/app/controllers/receber/receber_controller.dart';
import 'package:flutter_gofast/app/core/consts/colors_consts.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_gofast/app/views/pages/scanner/scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Receber extends StatefulWidget {
  @override
  _ReceberState createState() => _ReceberState();
}

class _ReceberState extends ModularState<Receber, ReceberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receber Encomendas',
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
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultProductScreen()));
                },
                child: Image.asset('assets/images/logo-limelocker.png'),
              ),
              Text("Clique no Lime para Scan"),
              SizedBox(
                height: 64,
              ),
              Container(height: 1, color: ColorsConst.grey400, width: 500),
              SizedBox(
                height: 16,
              ),
              Text(
                "Encomenda:",
                textAlign: TextAlign.start,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Ou digite o número'),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
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
