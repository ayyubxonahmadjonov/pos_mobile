import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/view/screens/barcode/components/barcode_listener_widget.dart';

class BarcodeListenerPage extends StatefulWidget {
  final String fromScanner;
  const BarcodeListenerPage({required this.fromScanner, Key? key})
      : super(key: key);

  @override
  State createState() => _BarcodeListenerPageState();
}

class _BarcodeListenerPageState extends State<BarcodeListenerPage> {
  late bool visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
              value: true,
              onChanged: (v) async {
                await AppPrefs.instance.setScanType(false);
              }),
          BarcodeListenerWidget(
            from: widget.fromScanner,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  AppIcons.barcodeScanner,
                  width: 250.w,
                ),
                SizedBox(height: 24.h),
                Text(
                  AppStrings.scanBarcode,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    )
  
    );
  }
}
