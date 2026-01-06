import 'package:flutter/material.dart';

class BarcodeSingleton {
  BarcodeSingleton._();

  static final BarcodeSingleton instance = BarcodeSingleton._();

  String _barcode = '';
  String get barcode => _barcode;
  set setBarcode(String barcode) => _barcode = barcode;

  PersistentBottomSheetController? _bottomSheetController;
  PersistentBottomSheetController? get bottomSheetController =>
      _bottomSheetController;
  set setBottomSheetController(PersistentBottomSheetController? controller) =>
      _bottomSheetController = controller;
}
