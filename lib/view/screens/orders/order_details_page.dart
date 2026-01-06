/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:15:22
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import 'components/data_with_widget.dart';
import 'components/new_order_list_tile.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderModel order;
  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: AppStrings.orders),
      body: Column(
        children: [
          Row(
            children: [
              // Выберите склад
              DataWithWiget(
                title: AppStrings.branch,
                child: AppDropButtonUI(
                  label: order.serviceName.toString(),
                  color: AppColors.fillColor,
                  onPressed: () {},
                ),
              ).wrapExpanded(),

              SizedBox(width: 10.w),

              // Выберите дата
              DataWithWiget(
                title: AppStrings.date,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(order.createdAt.toString().substring(0, 10)),
                    SvgPicture.asset(AppIcons.calendar)
                  ],
                ).wrapContainer(color: AppColors.fillColor),
              ).wrapExpanded(),
            ],
          ),
          Visibility(
            visible: order.note.isNotEmpty,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                DataWithWiget(child: Text(order.note).wrapContainer()),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Product header

          Row(
            children: [
              const Text('№'),
              SizedBox(width: 8.w),
              const Text(AppStrings.name),
              const Spacer(),
              Text(
                AppStrings.stock,
                style: AppTextStyle.medium(size: 14.0),
              ),
              SizedBox(width: 25.w),
              Text(
                AppStrings.quantity,
                style: AppTextStyle.medium(size: 14.0),
              ),
            ],
          ),

          // Item list
          ListView.separated(
            itemCount: order.items.length,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            separatorBuilder: (_, __) => Divider(
              height: 1.h,
              color: AppColors.grey,
              thickness: 0.5.h,
            ),
            itemBuilder: (context, index) {
              OrderItem item = order.items[index];

              return NewOrderListTile(
                index: index,
                item: item,
                isUpdate: false,
              );
            },
          ).wrapExpanded(),
          SizedBox(height: 24.h),
        ],
      ).symmetricPadding(h: 16.0, v: 12.0),
    );
  }
}
