/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 13:52:38
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';

class EmployeeHelper {
  const EmployeeHelper._();
  static final Box<Employee> box = HiveBoxes.employeeBox;
  static final Box _prefBox = HiveBoxes.prefBox;

  static Future<void> putAll(List<Employee> employees) async {
    Map<String, Employee> entries = {};

    for (var employee in employees) {
      entries[employee.key] = employee;
    }
    await box.putAll(entries);
  }

  static Iterable<Employee> getEmployeeList() {
    final Iterable<Employee> list = box.values;
    return list;
  }

  static Employee? get currentEmployee => _prefBox.get('current_employee');
  static Future<void> setCurrntEmployee(Employee employee) async {
    await _prefBox.put('current_employee', employee);
  }
}
