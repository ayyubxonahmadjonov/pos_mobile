/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 13:18:01
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/employee_helper.dart';
import 'package:pos_mobile/models/employee/employee_model.dart';
import 'package:pos_mobile/routes/routes.dart';

class OrderEmployeeListWidget extends StatelessWidget {
  const OrderEmployeeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Employee> employees = EmployeeHelper.getEmployeeList().toList();
    GetOrderBloc orderBloc = BlocProvider.of(context);

    return BlocBuilder<GetOrderBloc, GetOrderState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              title: Text(
                AppStrings.employees,
                style: TextStyle(color: AppColors.black),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return ListTile(
                      title: const Text(AppStrings.all).symmetricPadding(h: 12),
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Employee employee = Employee(
                          id: "",
                          name: AppStrings.all,
                        );
                        orderBloc.add(GetOrderByEmployeeEvent(employee));
                        AppNavigator.pop();
                      },
                    );
                  }
                  Employee employee = employees[index - 1];

                  return ListTile(
                    title: Text(employee.getFullName()).symmetricPadding(h: 12),
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      orderBloc.add(GetOrderByEmployeeEvent(employee));
                      AppNavigator.pop();
                    },
                  );
                },
                childCount: employees.length + 1,
              ),
            ),
          ],
        );
      },
    );
  }
}
