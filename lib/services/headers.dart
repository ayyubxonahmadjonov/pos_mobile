/*
    Created by: Bakhromjon Polat
    Created on: Dec 28 2022 15:16:18

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/services/api_service_interface.dart';

class ApiHeaders {
  ApiHeaders._();
  static ApiHeaders instance = ApiHeaders._();
  

  Map<String, String> getHeader(HeadersEnum? headersEnum) {
    switch (headersEnum) {
      case HeadersEnum.general:
        return general;

      case HeadersEnum.withToken:
        return withToken();

      case HeadersEnum.withTokenV2:
        return withTokenV2();

      case HeadersEnum.withAcceptServiceAndToken:
        return withAcceptServiceAndToken();

      case HeadersEnum.withAcceptService:
        return withAcceptService();

      case HeadersEnum.forItems:
        return forItems();

      case HeadersEnum.forOrder:
        return forOrder();

      default:
        return general;
    }
  }

  final Map<String, String> general = {
    'Accept-version': '1.0.0',
    'Content-Type': 'application/json',
    'Accept-User': 'employee'
  };

  Map<String, String> withToken() => {
        'Accept-User': 'employee',
        'Accept-version': '1.0.0',
        'Authorization': AppPrefs.instance.token,
        'Content-Type': 'application/json'
      };
  Map<String, String> withTokenAdmin() => {
        'Accept-User': 'admin',
        'Accept-version': '1.0.0',
        'Authorization': AppPrefs.instance.token,
        'Content-Type': 'application/json'
      };

  Map<String, String> withTokenV2() => {
       'timezone': '-300',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppPrefs.instance.token}',
      };

  Map<String, String> withAcceptServiceAndToken() => {
        'Accept-Version': '1.0.0',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-User': 'employee',
        'Accept-EmptyShow': '0',
        'Authorization': AppPrefs.instance.token,
        'Accept-Service': AppPrefs.instance.employeeService?.service ?? '',
      };

  Map<String, String> withAcceptService() => {
        'Accept-Version': '1.0.0',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-User': 'employee',
        'Accept-EmptyShow': '0',
        'Accept-Service': AppPrefs.instance.employeeService?.service ?? '',
      };

  Map<String, String> forItems() => {
        'Authorization': AppPrefs.instance.token,
        'Accept-User': 'employee',
        'Accept-Version': '2.0.0',
        'Content-Type': 'application/json',
      };
  Map<String, String> forOrder() => {
        'Authorization': EmployeeHelper.currentEmployee?.token ?? "",
        'Accept-User': 'employee',
        'Accept-Version': '2.0.0',
        'Content-Type': 'application/json',
      };
}
