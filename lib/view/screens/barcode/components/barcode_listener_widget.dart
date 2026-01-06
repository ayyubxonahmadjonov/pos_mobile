/*

  Created by: Bakhromjon Polat
  Created on: Mar 04 2023 15:40:41
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/product_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/home/pages/items/product_details_screen.dart';
import 'package:pos_mobile/view/screens/screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BarcodeListenerWidget extends StatelessWidget {
  final Widget child;
  final String from;
  final bool ? editC;
  const BarcodeListenerWidget({
    super.key,
    this.editC=false,
    required this.child,
    required this.from,
  });

  @override
  Widget build(BuildContext context) {
    bool visible = false;
    return VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo info) {
          visible = info.visibleFraction > 0;
        },
        key: const Key('visible-detector-key'),
        child: BarcodeKeyboardListener(
          bufferDuration: const Duration(milliseconds: 200),
          useKeyDownEvent: true,
          onBarcodeScanned: (barcode) {
            if (!visible) return;
            ProductFromJson? product = HiveItemsHelper.getByBarcode(barcode);
            if (product == null) {
              Fluttertoast.showToast(msg: AppStrings.productNotFound);
            } else {
              switch (from) {
                case "purchase":
                  // AppNavigator.push(AddPurchaseProduct(product: product, dispatch: editC,));
                  break;
                case "order":
                  // OrderItem orderItem = OrderItem.fromProduct(product);
                  // OrderHelper.setCurrentItem = orderItem;
                  // AppNavigator.push(const OrderCountPage());
                  break;

                case "inventory":
                  AppNavigator.push(ProductDetilsScreen(product: product));
                  break;
                default:
              }
            }
          },
          child: child,
        ));
  }
}
