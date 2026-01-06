/*

  Created by: Bakhromjon Polat
  Created on: Feb 28 2023 11:41:29
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/service/employee_service.dart';
import 'package:pos_mobile/routes/routes.dart';

class ServiceListWidget extends StatelessWidget {
  final ValueChanged<EmployeeService> onServiceSelected;
  final bool hasAll;
  const ServiceListWidget({
    super.key,
    required this.onServiceSelected,
    required this.hasAll,
  });

  @override
  Widget build(BuildContext context) {
    List<EmployeeService> employeeService =
        AppPrefs.instance.employee.services ?? [];

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          pinned: true,
          title: Text(
            AppStrings.selectBranch,
            style: TextStyle(color: AppColors.black),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                if (!hasAll) {
                  return const SizedBox();
                }
                return ListTile(
                  title: const Text(AppStrings.all).symmetricPadding(h: 12),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    EmployeeService service = EmployeeService(
                      id: "",
                      service: "",
                      serviceName: AppStrings.all,
                    );
                    onServiceSelected.call(service);

                    AppNavigator.pop();
                  },
                );
              }
              EmployeeService service = employeeService[index - 1];

              return ListTile(
                title: Text(service.serviceName).symmetricPadding(h: 12),
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  onServiceSelected.call(service);
                  AppNavigator.pop();
                },
              );
            },
            childCount: employeeService.length + 1,
          ),
        ),
      ],
    );
  }
}
