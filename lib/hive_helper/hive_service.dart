/*
    Created by: Bakhromjon Polat
    Created on: Dec 28 2022 16:05:26

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_mobile/hive_helper/hive_box_names.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/product_model.dart'
    show ProductFromJsonAdapter, ProductFromJson;

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    Directory directory = await getApplicationSupportDirectory();
    await Hive.initFlutter(directory.path);

    Hive.registerAdapter(EmployeeAdapter());
    Hive.registerAdapter(UiLanguageAdapter());
    Hive.registerAdapter(EmployeeServiceAdapter());
    Hive.registerAdapter(AccessModelAdapter());
    Hive.registerAdapter(ProductApdapter());
    Hive.registerAdapter(HistoryAdapter());
    Hive.registerAdapter(OrderModelAdapter());
    Hive.registerAdapter(OrderItemAdapter());
    Hive.registerAdapter(ProductFromJsonAdapter());

    await Hive.openBox(HiveBoxNames.prefs);
    await Hive.openBox<Product>(HiveBoxNames.products);
    await Hive.openBox<HistoryModel>(HiveBoxNames.history);
    await Hive.openBox<Employee>(HiveBoxNames.employees);
    await Hive.openBox<ProductFromJson>(HiveBoxNames.productFromJson);
  }
}
