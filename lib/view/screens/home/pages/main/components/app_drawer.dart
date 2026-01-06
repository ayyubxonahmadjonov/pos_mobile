/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 13:13:55
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/employee/employee_model.dart';
import 'package:pos_mobile/models/service/employee_service.dart';
import 'package:pos_mobile/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(),
          ListTile(
            title: const Text('Заказы на поставку'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Перемещение'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Инвентаризация'),
            onTap: () {
              AppNavigator.pushNamed(RouteNames.inventory);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Employee? employee = EmployeeHelper.currentEmployee;
    EmployeeService? service = AppPrefs.instance.employeeService;
    return UserAccountsDrawerHeader(
      accountName: Text(employee?.getFullName() ?? ""),
      accountEmail: Text(service?.serviceName ?? ""),
    );
  }
}
