import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/view/screens/barcode/barcode.dart';

class SelectBarCodeTypePage extends StatelessWidget {
  final String from;
  const SelectBarCodeTypePage({required this.from, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppPrefs.instance.box.listenable(
          keys: ['scan_type'],
        ),
        builder: (BuildContext context, Box box, child) {
          bool isScan = AppPrefs.instance.scanType;
          return Scaffold(
            appBar: isScan ? AppBar(title: const Text('Scanner')) : null,
            body: isScan
                ? BarcodeListenerPage(fromScanner: from)
                : BarcodeScanPage(from: from),
          );
        });
  }
}
