/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 17:43:41
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';

// ignore: must_be_immutable
class NewOrderListTile extends StatelessWidget {
  final int index;
  final OrderItem item;
  bool isUpdate;
  NewOrderListTile({
    Key? key,
    required this.index,
    required this.item,
    this.isUpdate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (isUpdate) {
          OrderHelper.setCurrentItem = item;
          AppNavigator.pushNamed(RouteNames.updateOrder);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${index + 1}.',
              style: AppTextStyle.medium(size: 12.0),
            ),
            if (!isUpdate)
              Container(
                height: 8.h,
                width: 8.w,
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                decoration: AppShapes.circular(
                  color: item.isAccept ? AppColors.primary : AppColors.red,
                ),
              ),
            Text(
              '${item.productName}',
              style: AppTextStyle.medium(size: 12.0),
            ).wrapExpanded(flex: 4),
            SizedBox(width: 12.w),
            Text(
              item.getInStock(),
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(size: 12.0),
            ).wrapExpanded(flex: 1),
            // const SizedBox(),
            SizedBox(width: 12.w),
            Text(
              '${item.orderQuantity}',
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(size: 12.0),
            ).wrapExpanded(flex: 1),
          ],
        ),
      ),
    );
  }
}
