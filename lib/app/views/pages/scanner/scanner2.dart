import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/controllers/barcode/barcode_controller.dart';
import 'package:flutter_gofast/app/controllers/product/product_controller.dart';
import 'package:flutter_gofast/app/core/consts/routers_consts.dart';
import 'package:flutter_gofast/app/core/services/product_services.dart';
import 'package:flutter_gofast/app/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String barcode = "";
  String description = "";
  String thumbnail = "";
  String avgPrice = "";

  void getProduct() async {
    BarcodeController barcodeController = BarcodeController();
    ProductService productService = ProductService();
    ProductModel productModel = ProductModel();

    String barcode;
    ProductController product;

    try {
      barcode = await barcodeController.barcodeScanning();
      product = await productService.getDetailProduct(barcode);
      productModel.saveProduct(product);

      setState(() {
        this.barcode = barcode;
        this.description = product.description;
        this.thumbnail = product.thumbnail;
        this.avgPrice =
            product.avgPrice == null ? "" : product.avgPrice.toString();
      });
    } catch (e) {
      this.barcode = e.toString();
    }
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('$description'),
            backgroundColor: Colors.green[700],
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(RoutersConst.camera);
                  },
                  child: Text(
                    "TIRE A FOTO DO PRODUTO",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green[800],
                ),
              ],
            ),
          )),
    );
  }
}
