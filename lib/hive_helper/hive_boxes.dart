/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:47:53

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_box_names.dart';
import 'package:pos_mobile/models/employee/employee_model.dart';
import 'package:pos_mobile/models/history/history.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/models/product/scanned_product.dart';
import 'package:pos_mobile/product_model.dart';

class HiveBoxes {
  const HiveBoxes._();

  static Box prefBox = Hive.box(HiveBoxNames.prefs);
  static Box<Product> productsBox = Hive.box(HiveBoxNames.products);

  static Box<HistoryModel> historyBox = Hive.box(HiveBoxNames.history);
  static Box<Employee> employeeBox = Hive.box(HiveBoxNames.employees);
  static Box<ProductFromJson> productFromJsonBox = Hive.box(HiveBoxNames.productFromJson);
  static Box<ScannedProduct> scannedProductBox = Hive.box(HiveBoxNames.countedProductForNewBox);


  static Future<void> clearBoxes() async {
    await Future.wait([
      prefBox.clear(),
      productsBox.clear(),
      historyBox.clear(),
      employeeBox.clear(),
      scannedProductBox.clear(),
    ]);
  }
}
