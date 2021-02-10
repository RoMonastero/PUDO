import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_gofast/app/views/pages/scanner/scanner2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfirmaEntrega extends StatelessWidget {
  final String barcode;
  final String description;
  final String thumbnail;
  final String avgPrice;

  ConfirmaEntrega(
      {this.barcode, this.avgPrice, this.description, this.thumbnail});

  @override
  Widget build(BuildContext context) {
    //utilizando esse if para quando o usuario utiliza o leitor
    if (barcode != null &&
        description != null &&
        thumbnail != null &&
        avgPrice != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Confirmação de Entrega'),
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  thumbnail,
                  height: 100.0,
                  width: 100.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Código: $barcode",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  avgPrice,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(RoutersConst.scanner2);
                  },
                  child: Text(
                    "SALVAR",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green[800],
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  child: Text(
                    'VOLTAR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red[700],
                ),
              ],
            ),
          ));
      //esse else é para quando o usuario não utiliza o leitor
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Confirmação de Entrega'),
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('assets/images/encomenda-exemplo.webp'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Código: exemplo",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'exemplo',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'exemplo',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Scanner()));
                  },
                  child: Text(
                    "SALVAR",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green[800],
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  child: Text(
                    'VOLTAR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red[700],
                ),
              ],
            ),
          ));
    }
  }
}
