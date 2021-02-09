import 'package:flutter_gofast/app/controllers/product/product_controller.dart';

import '../config/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductService {
  String _domain = "https://api.cosmos.bluesoft.com.br";
  var _accessToken = ConfigCosmos["accessToken"];

  Future<ProductController> getDetailProduct(String barcode) async {
    try {
      var response = await http.get(_domain + "/gtins/$barcode", headers: {
        "Content-Type": "application/json",
        'X-Cosmos-Token': _accessToken
      });

      var product;
      if (response.statusCode == 200) {
        var details = convert.jsonDecode(response.body);
        product = ProductController.fromJson(details);
      } else {
        throw new Exception("Erro ao buscar informação.");
      }
      return product;
    } catch (e) {
      rethrow;
    }
  }
}
