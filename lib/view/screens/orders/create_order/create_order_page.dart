/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 17:45:42
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/orders/create_order/create_order_footer.dart';
import 'package:pos_mobile/view/screens/orders/components/order_reauired_date_widget.dart';
import 'package:pos_mobile/view/screens/orders/components/service_list_widget.dart';
import 'package:pos_mobile/view/screens/orders/create_order/create_order_app_bar.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import '../components/data_with_widget.dart';
import '../components/new_order_list_tile.dart';

class CreateOrderScreen extends StatelessWidget {
  CreateOrderScreen({Key? key}) : super(key: key);

  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOrderBloc, CreateOrderState>(
      listener: (context, state) {
        if (state is CreateOrderSuccessState) {
          Fluttertoast.showToast(msg: 'Order created');
          AppNavigator.pop(state.order);
        }

        if (state is CreateOrderFailedState) {
          Fluttertoast.showToast(msg: state.error);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => Future.value(state is! CreateOrderProcessState),
          child: UnfocusWidget(
            child: Scaffold(
              appBar: CreatingOrderAppBar(noteController: _noteController),
              bottomNavigationBar: const CreatingOrderFooter(),
              body: ValueListenableBuilder(
                valueListenable: OrderHelper.listener,
                builder: (context, Box box, w) {
                  OrderModel order = box.get('internal_order') ?? OrderModel();

                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        color: AppColors.primary,
                        child: Column(
                          children: [
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                // Выберите склад
                                DataWithWiget(
                                  // title: AppStrings.selectBranch,
                                  child: AppDropButtonUI(
                                    label: order.serviceName ?? 'Склад',
                                    color: AppColors.fillColor,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: AppColors.white,
                                        builder: (context) {
                                          return ServiceListWidget(
                                            hasAll: false,
                                            onServiceSelected: (value) {
                                              OrderHelper.setOrderService(
                                                value,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ).wrapExpanded(),
                                SizedBox(width: 10.w),

                                // Выберите дата
                                OrderRequiredDateWidget(
                                  requiredDate: order.requiredDate,
                                ).wrapExpanded(),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            AppInputField(
                              maxLines: 3,
                              hint: AppStrings.all,
                              action: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              controller: _noteController,
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '№',
                            style: AppTextStyle.medium(size: 12.0),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            AppStrings.name,
                            style: AppTextStyle.medium(size: 12.0),
                          ),
                          const Spacer(),
                          Text(
                            AppStrings.stock,
                            style: AppTextStyle.medium(size: 12.0),
                          ),
                          SizedBox(width: 25.w),
                          Text(
                            AppStrings.quantity,
                            style: AppTextStyle.medium(size: 12.0),
                          ),
                        ],
                      ).symmetricPadding(h: 16.0),
                      _showList(order.items),
                      SizedBox(height: 24.h),
                    ],
                  );
                },
              ),
            ).screenLoading(visible: state is CreateOrderProcessState),
          ),
        );
      },
    );
  }

  Expanded _showList(List<OrderItem> items) => ListView.separated(
        itemCount: items.length,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.0),
        separatorBuilder: (_, __) => Divider(
          height: 0.5.h,
          color: AppColors.grey,
        ),
        itemBuilder: (context, index) {
          OrderItem item = items[index];
          return Slidable(
            enabled: true,
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: .2,
              children: [
                SlidableAction(
                  padding: const EdgeInsets.all(5.0),
                  borderRadius: BorderRadius.circular(5),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  spacing: 6,
                  autoClose: true,
                  icon: Icons.delete,
                  onPressed: (_) async {
                    await OrderHelper.deleteFromList(item.productId);
                    Fluttertoast.showToast(msg: AppStrings.productWasDeleted);
                  },
                ),
              ],
            ),
            child: NewOrderListTile(index: index, item: item),
          );
        },
      ).wrapExpanded();
}
