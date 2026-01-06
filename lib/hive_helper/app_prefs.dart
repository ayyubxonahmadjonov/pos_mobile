/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:47:31

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_boxes.dart';
import 'package:pos_mobile/models/models.dart';

class AppPrefs {
  AppPrefs._();
  static AppPrefs instance = AppPrefs._();

  final Box box = HiveBoxes.prefBox;

  // === Employee ============================================================

  Future<void> setEmployee(Employee employee) async {
    await box.put('employee', employee);
  }

  Employee get employee => box.get('employee');

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // === Token ===============================================================

  Future<void> setToken(String? token) async {
    await box.put('token', token);
  }

  String get token => box.get('token') ?? '';

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Future<void> setService(String? id) async {
    await box.put('serviceId_instock', id);
  }
String get getServiceId {
    return box.get('serviceId_instock') ?? '';
  }

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // ======= Service ======================================================= //

  Future<void> setEmployeeService(EmployeeService? service) async {
    await box.put('employee_service', service);
  }

  EmployeeService? get employeeService => box.get('employee_service');

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Future<void> setLastUpdate() async {
    int date = DateTime.now().millisecondsSinceEpoch;
    await box.put('last_update', date);
  }

  int get lastUpdage => box.get('last_update') ?? 0;
  Future<void> setScanType(bool type) async {
    await box.put('scan_type', type);
  }
  Future<void> setString(String key, String value) async {
    await box.put(key, value);
  }

  String getString(String key, {String defaultValue = ''}) {
    return box.get(key) ?? defaultValue;
  }
    Future<void> setBool(String key, bool value) async {
    await box.put(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return box.get(key) ?? defaultValue;
  }
  bool get scanType => box.get('scan_type') ?? false;
}
