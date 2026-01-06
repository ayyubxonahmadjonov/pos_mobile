/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 11:51:51
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Employee? employee = EmployeeHelper.currentEmployee;
    EmployeeService? service = AppPrefs.instance.employeeService;

    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            employee?.name.toString() ?? "",
            style: AppTextStyle.medium(color: AppColors.white),
          ),
          Text(
            service?.serviceName ?? "",
            style: AppTextStyle.medium(
              color: AppColors.white.withOpacity(.5),
            ),
          ),
        ],
      ),
      actions: [
        RectangularButton(
          icon: Icons.lock,
          iconColor: AppColors.primary,
          margin: EdgeInsets.only(right: 16.w),
          onTap: () => AppNavigator.pushNamedAndRemoveUntil(RouteNames.pincode),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64.h);
}
