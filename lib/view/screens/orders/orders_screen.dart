/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:15:33
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/orders/components/order_list_tile.dart';

import 'components/orders_app_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _indicatorKey = GlobalKey<RefreshIndicatorState>();
  late GetOrderBloc _orderBloc;

  @override
  void initState() {
    super.initState();
    _orderBloc = BlocProvider.of<GetOrderBloc>(context);
    _orderBloc.add(GetOrderPaginationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      // AppBar
      appBar: OrdersAppBar(),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonPressed,
        child: const Icon(Icons.add, color: AppColors.white),
      ),

      // Body
      body: RefreshIndicator(
        key: _indicatorKey,
        onRefresh: () async {
          _orderBloc.add(GetOrderPaginationEvent());
        },
        child: BlocBuilder<GetOrderBloc, GetOrderState>(
          builder: (context, state) {
            GetOrderBloc orderBloc = BlocProvider.of(context);

            if (orderBloc.orderList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            List<OrderModel> orders = [];

            Employee employee = orderBloc.employee;
            EmployeeService service = orderBloc.service;

            orders = orderBloc.orderList.where((order) {
              bool isEmployeeEqual = true;
              bool isServiceEqual = true;
              if (employee.id.isNotEmpty) {
                isEmployeeEqual = employee.id == order.employeeId;
              }
              if (service.id.isNotEmpty) {
                isServiceEqual = service.service == order.serviceId;
              }

              return isEmployeeEqual && isServiceEqual;
            }).toList();

            return ListView.separated(
              itemCount: orders.length + 1,
              separatorBuilder: (context, index) => Divider(
                color: AppColors.grey,
                thickness: 0.5.h,
                height: 0.5.h,
              ),
              itemBuilder: (context, index) {
                if (index == orders.length) {
                  orderBloc.add(GetOrderPaginationEvent());
                  return Container(
                    height: 56.h,
                    width: 56.w,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ).visibility(visible: !orderBloc.finished);
                }
                OrderModel order = orders[index];
                return OrderListTile(order: order);
              },
            );
          },
        ),
      ),
    );
  }

  void _onButtonPressed() async {
    if (!OrderHelper.hasOrder) {
      await OrderHelper.createOrder();
    }
    // await OrderHelper.createOrder();

    AppNavigator.pushNamed(RouteNames.newOrder).then((value) {
      if (value != null) {
        _orderBloc.add(GetOrderAddNewOrderEvent(value));
      }
    });
  }
}

typedef TransitionBuilder = Widget Function(
    BuildContext context, dynamic order, int i);
