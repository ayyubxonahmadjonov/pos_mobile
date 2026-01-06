/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:18:55

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
part 'employee_service.g.dart';

@HiveType(
  typeId: HiveTypes.employeeService,
  adapterName: HiveAdapters.employeeServiceAdapter,
)
class EmployeeService {
  EmployeeService({
    bool? available,
    String? id,
    String? service,
    String? serviceName,
  }) {
    _available = available;
    _id = id;
    _service = service;
    _serviceName = serviceName;
  }

  EmployeeService.fromJson(dynamic json) {
    _available = json['available'];
    _id = json['_id'];
    _service = json['service'];
    _serviceName = json['service_name'];
  }

  @HiveField(0)
  bool? _available;

  @HiveField(1)
  String? _id;

  @HiveField(2)
  String? _service;

  @HiveField(3)
  String? _serviceName;

  EmployeeService copyWith({
    bool? available,
    String? id,
    String? service,
    String? serviceName,
  }) =>
      EmployeeService(
        available: available ?? _available,
        id: id ?? _id,
        service: service ?? _service,
        serviceName: serviceName ?? _serviceName,
      );

  bool? get available => _available;

  String get id => _id ?? "";

  String? get service => _service;

  String get serviceName => _serviceName ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['available'] = _available;
    map['_id'] = _id;
    map['service'] = _service;
    map['service_name'] = _serviceName;
    return map;
  }
}
