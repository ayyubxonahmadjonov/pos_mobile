/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:20:45
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/view/screens/orders/components/employee_list_widget.dart';
import 'package:pos_mobile/view/screens/orders/components/service_list_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';
import 'data_with_widget.dart';
import 'order_search_delegate.dart';

// ignore: must_be_immutable
class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  OrdersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetOrderBloc orderBloc = BlocProvider.of(context);

    return AppBar(
      title: const Text(AppStrings.orders),
      elevation: 1.0,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {
            showSearch(context: context, delegate: OrderSerachDelegate());
          },
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 56.h),
        child: Row(
          children: [
            DataWithWiget(
              child: AppDropButtonUI(
                label: orderBloc.service.serviceName,
                color: AppColors.white,
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.white,
                    builder: (context) {
                      return ServiceListWidget(
                        hasAll: true,
                        onServiceSelected: (value) {
                          orderBloc.add(GetOrderByServiceEvent(value));
                        },
                      );
                    },
                  );
                },
              ),
            ).wrapExpanded(),
            SizedBox(width: 12.w),
            DataWithWiget(
              child: AppDropButtonUI(
                color: AppColors.white,
                label: context.watch<GetOrderBloc>().employee.getFullName(),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.white,
                    builder: (context) {
                      return BlocProvider.value(
                        value: orderBloc,
                        child: const OrderEmployeeListWidget(),
                      );
                    },
                  );
                },
              ),
            ).wrapExpanded(),
          ],
        ).symmetricPadding(v: 12, h: 16),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 140.h);
}
