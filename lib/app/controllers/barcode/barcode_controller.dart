import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class BarcodeController {
  Future<String> barcodeScanning() async {
    try {
      String barcode = await BarcodeScanner.scan();
      return barcode;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        throw new Exception('Câmera não autorizada!');
      } else {
        throw new Exception('Erro desconhecido: $e');
      }
    } on FormatException {
      throw new Exception('Não foi possível ler o código de barras.');
    } catch (e) {
      throw new Exception('Erro desconhecido: $e');
    }
  }
}

class ScanResult {}
