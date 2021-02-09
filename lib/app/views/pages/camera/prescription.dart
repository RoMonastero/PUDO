import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_gofast/app/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class PrescriptionScreen extends StatefulWidget {
  final User user;
  final VoidCallback onLogout;

  const PrescriptionScreen({this.user, this.onLogout});

  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  File imageFile;
  final picker = ImagePicker();

  _openCamera(BuildContext context) async {
    final picture = await picker.getImage(source: ImageSource.camera);

    setState(() {
      imageFile = File(picture.path);
    });
    await uploadImageToFirebase(context);
  }

  Future uploadImageToFirebase(BuildContext context) async {
    var user = Provider.of<User>(context, listen: false).name;
    String fileName = "receitamedica-$user-" +
        DateTime.now()
            .toString()
            .replaceAll("-", "")
            .replaceAll(" ", "-")
            .replaceAll(":", "")
            .replaceAll(".", "");
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('limelocker-prescription/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    await taskSnapshot.ref
        .getDownloadURL()
        .then((value) => print("Done: $value"));
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Icon(Icons.wallpaper, size: 230.0, color: Colors.grey),
              const SizedBox(
                height: 200.00,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        _openCamera(context);
                      },
                      child: Column(
                        children: <Widget>[
                          const Icon(Icons.camera_alt, size: 50.0), // icon
                          const Text("Câmera"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 56.0, left: 56.0, right: 56.0, top: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.file(
                  imageFile,
                ),
                const SizedBox(height: 40.00),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _openCamera(context);
                      },
                      child: Column(
                        children: <Widget>[
                          const Icon(Icons.camera_alt, size: 50.0), // icon
                          const Text("Câmera"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tire Foto da Encomenda',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _decideImageView(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 24.0),
                child: RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(RoutersConst.confirmaPage);
                  },
                  child: Text("SALVAR"),
                  color: Colors.green[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
