import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gofast/app/controllers/product/product_controller.dart';

class ProductModel {
  void saveProduct(ProductController productController) async {
    Firestore firestore = Firestore.instance;
    await firestore.collection("products").add({
      "gtin": productController.gtin,
      "name": productController.description,
      "image": productController.thumbnail,
      "price": productController.price,
      "averagePrice": productController.avgPrice,
      "grossWeight": productController.grossWeight,
      "netWeight": productController.netWeight,
      "typePackaging": productController.gtins
          .firstWhere((element) => element.gtin == productController.gtin)
          .commercialUnit
          .typePackaging,
      "quantityPackaging": productController.gtins
          .firstWhere((element) => element.gtin == productController.gtin)
          .commercialUnit
          .quantityPackaging,
      "ncm": productController.ncm.code,
      "ncmName": productController.ncm.description,
      "ncmDescription": productController.ncm.fullDescription,
      //"gpc": productController.gpc.code,
      //"gpcDescription": productController.gpc.description,
    });
  }
}
