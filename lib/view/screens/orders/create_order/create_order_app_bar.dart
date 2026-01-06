/*

  Created by: Bakhromjon Polat
  Created on: Mar 01 2023 16:12:15
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/create_order/create_order_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class CreatingOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController noteController;
  const CreatingOrderAppBar({super.key, required this.noteController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: const Text(AppStrings.orders),
      actions: [
        AppIconButton(
          icon: Icons.more_vert,
          onPressed: () => _onCompletePressed(context),
        )
      ],
    );
  }

  Future _onCompletePressed(BuildContext context) async {
    CreateOrderBloc createOrderBloc = BlocProvider.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft: Radius.circular(12.r),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(AppStrings.complete),
            // SizedBox(height: 12.h),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              shape: AppShapes.simple(),
              elevation: 5.0,
              child: ListTile(
                shape: AppShapes.simple(),
                title: const Text(AppStrings.complete),
                onTap: () async {
                  if (OrderHelper.getOrder.items.isEmpty) {
                    Fluttertoast.showToast(msg: AppStrings.addOneItem);
                    AppNavigator.pop();
                    return;
                  }

                  String note = noteController.text.trim();
                  await OrderHelper.setDate();
                  await OrderHelper.setNote(note);
                  OrderModel order = OrderHelper.getOrder;
                  createOrderBloc.add(CreateOrderPressedEvent(order));
                  AppNavigator.pop();
                },
              ),
            ),
            // SizedBox(height: 12.h),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kTextTabBarHeight);
}
