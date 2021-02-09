import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gofast/app/controllers/barcode/barcode_controller.dart';
import 'package:flutter_gofast/app/controllers/product/product_controller.dart';
import 'package:flutter_gofast/app/core/services/product_services.dart';
import 'package:flutter_gofast/app/models/product_model.dart';
import '../entregar/confirmar_entrega.dart';

class ResultProductScreen extends StatefulWidget {
  @override
  _ResultProductState createState() => _ResultProductState();
}

class _ResultProductState extends State<ResultProductScreen> {
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
    return ConfirmaEntrega(
      barcode: barcode,
      description: description,
      thumbnail: thumbnail,
      avgPrice: avgPrice,
    );
  }
}
