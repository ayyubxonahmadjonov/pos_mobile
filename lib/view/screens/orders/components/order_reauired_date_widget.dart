/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 17:14:14
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';

import 'data_with_widget.dart';

class OrderRequiredDateWidget extends StatelessWidget {
  final int requiredDate;
  const OrderRequiredDateWidget({super.key, required this.requiredDate});

  @override
  Widget build(BuildContext context) {
    return DataWithWiget(
      // title: AppStrings.selectDate,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppFormatter.formatDateFromMills(
              requiredDate,
              pattern: "dd/mm/yyyy",
            ),
            style: AppTextStyle.medium(size: 15.0),
          ),
          SvgPicture.asset(AppIcons.calendar)
        ],
      ).wrapContainer(color: AppColors.fillColor).onClick(() async {
        DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 360)),
        );
        if (dateTime == null) return;
        await OrderHelper.setRequiredDate(dateTime);
      }),
    );
  }
}
