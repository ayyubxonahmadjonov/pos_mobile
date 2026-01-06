/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 17:44:38
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/orders/orders.dart';

import 'indicator.dart';

class OrderListTile extends StatelessWidget {
  final OrderModel order;
  const OrderListTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(OrderDetailsPage(order: order));
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.h),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppProgressIndicator(
                max: order.itemsCount,
                value: order.acceptItemsCount,
              ),
              SizedBox(width: 12.w),
              _setData(
                order.pOrder.toString(),
                order.createdAt.toString().substring(0, 10),
                isRight: false,
              ),
              const Spacer(),
              _setData(
                order.serviceName.toString(),
                order.employeeName.toString(),
              ),
            ],
          )),
    );
  }

  Widget _setData(String header, String footer, {bool isRight = true}) =>
      Column(
        crossAxisAlignment:
            isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          _setText(header),
          SizedBox(height: 4.h),
          FittedBox(
            child: _setText(
              footer,
              size: 14.0,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      );

  Text _setText(String data, {Color? color, double size = 15.0}) => Text(
        data,
        style: AppTextStyle.medium(
          size: size,
          color: color,
          // fontFamily: AppTextStyle.urbanist,
        ),
      );
}
