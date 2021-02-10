import 'package:flutter_gofast/app/controllers/home_controller.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Aqui é a home
class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(
          'Serviços',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.location_on,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    "Locker de entrega",
                    style: TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(
                    "LimeCleanS1",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CriaCard(
                color: 200,
                titulo: "Receber",
                rota: RoutersConst.receber,
              ),
              CriaCard(
                color: 400,
                titulo: "Entregar",
                rota: RoutersConst.entregar,
              ),
              CriaCard(
                color: 700,
                titulo: "Outros",
                rota: RoutersConst.receber,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 55,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                ),
              ),
              SizedBox(
                width: 55,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info,
                ),
              ),
              SizedBox(
                width: 55,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.group,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
