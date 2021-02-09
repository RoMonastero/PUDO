import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CriaCard extends StatelessWidget {
  final int color;
  final String titulo;
  final rota;

  const CriaCard({Key key, this.color, this.titulo, this.rota})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.green[color],
      ),
      title: Text(titulo),
      onTap: () {
        Modular.to.pushNamed(rota);
      },
    ));
  }
}
