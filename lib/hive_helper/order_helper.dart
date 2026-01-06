/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 10:45:24
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/order/order_model.dart';

import 'hive_helper.dart';

class OrderHelper {
  OrderHelper._();
  static final Box _box = HiveBoxes.prefBox;
  static final AppPrefs _prefs = AppPrefs.instance;
  static get listener => _box.listenable(keys: ['internal_order']);

  static late OrderItem _currentItem;

  static Future<void> createOrder() async {
    String? organization = _prefs.employee.organization;
    String? employeeId = EmployeeHelper.currentEmployee?.id;
    String? employeeName = EmployeeHelper.currentEmployee?.name;
    String? serviceId = _prefs.employeeService?.service;
    String? serviceName = _prefs.employeeService?.serviceName;

    OrderModel order = OrderModel(
      date: DateTime.now().millisecondsSinceEpoch,
      organizationId: organization,
      items: [],
      serviceId: serviceId,
      serviceName: serviceName,
      employeeId: employeeId,
      employeeName: employeeName,
      requiredDate: DateTime.now().millisecondsSinceEpoch,
    );
    await _box.put('internal_order', order);
  }

  static Future addItem(OrderItem item) async {
    OrderModel order = getOrder;
    List<OrderItem> items = order.items;
    for (int i = 0; i < items.length; i++) {
      if (items[i].productId == item.productId) {
        items[i] = item;
        await order.save();
        return;
      }
    }
    items.add(item);
    await order.save();
  }

  static Future setRequiredDate(DateTime date) async {
    getOrder.requiredDate = date.millisecondsSinceEpoch;
    await getOrder.save();
  }

  static Future setDate() async {
    getOrder.date = DateTime.now().millisecondsSinceEpoch;
    await getOrder.save();
  }

  static Future setNote(String note) async {
    getOrder.note = note;
    await getOrder.save();
  }

  static Future deleteFromList(String? key) async {
    getOrder.items.removeWhere((item) => key == item.productId);
    await getOrder.save();
  }

  static Future<void> setOrderService(EmployeeService service) async {
    getOrder
      ..serviceId = service.service
      ..serviceName = service.serviceName;

    await getOrder.save();
  }

  static OrderModel get getOrder => _box.get('internal_order');
  static bool get hasOrder => _box.get('internal_order') != null;
  static OrderItem get currentItem => _currentItem;
  static set setCurrentItem(OrderItem orderItem) {
    for (var item in getOrder.items) {
      if (item.productId == orderItem.productId) {
        orderItem = item;
        break;
      }
    }
    _currentItem = orderItem;
  }

  static Future<void> deleteOrder() async => _box.delete('internal_order');
}
