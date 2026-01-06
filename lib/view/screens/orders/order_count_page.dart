import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/order/order_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/orders/components/data_with_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import 'components/data_with_title.dart';

// ignore: must_be_immutable
class OrderCountPage extends StatefulWidget {
  const OrderCountPage({Key? key}) : super(key: key);

  @override
  State<OrderCountPage> createState() => _OrderCountPageState();
}

class _OrderCountPageState extends State<OrderCountPage> {
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _realStockController = TextEditingController();
  num? _realStock;
  late OrderItem _orderItem;
  bool _hasRealStock = false;
  @override
  void initState() {
    super.initState();
    _orderItem = OrderHelper.currentItem;
    _realStock = _orderItem.realStock;

    if (_orderItem.orderQuantity != null) {
      _countController.text = _orderItem.orderQuantity.toString();
    }

    if (_realStock != null) {
      _hasRealStock = true;
      _realStockController.text = _realStock.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(title: AppStrings.products),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Column(
            children: [
              // Product name
              DataWithTitle(
                title: AppStrings.itemName,
                data: _orderItem.productName ?? "",
                color: AppColors.fillColor,
              ),

              // In stock
              Row(
                children: [
                  Expanded(
                    child: DataWithTitle(
                      title: AppStrings.stock,
                      data: _orderItem.inStock.toString(),
                      color: AppColors.fillColor,
                    ),
                  ),
                  CupertinoSwitch(
                    value: _hasRealStock,
                    onChanged: (v) => setState(() => _hasRealStock = v),
                  ),
                ],
              ),

              // Real Stock
              Visibility(
                visible: _hasRealStock,
                child: DataWithWiget(
                  title: AppStrings.realCount,
                  child: AppInputField(
                    controller: _realStockController,
                    hint: '0',
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    formatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                    ],
                    action: TextInputAction.next,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Count
              DataWithWiget(
                title: AppStrings.quantity,
                child: AppInputField(
                  hint: '0',
                  autofocus: true,
                  controller: _countController,
                  keyboardType: TextInputType.number,
                  action: TextInputAction.done,
                  formatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^d*\.?\d*)'))
                  ],
                ),
              ),
              // SizedBox(height: 24.h),

              const Spacer(),
              // Save button
              PrimaryButton(
                label: AppStrings.save,
                onPressed: () async {
                  String count = _countController.text.trim();
                  if (count.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter a count');
                    return;
                  }

                  if (_realStockController.text.isNotEmpty && _hasRealStock) {
                    _realStock = num.parse(_realStockController.text);
                  }

                  num countNum = num.parse(count);
                  OrderItem orderItem = OrderItem(
                    barcode: _orderItem.barcode,
                    inStock: _orderItem.inStock,
                    date: DateTime.now().millisecondsSinceEpoch,
                    productId: _orderItem.productId,
                    orderQuantity: countNum,
                    realStock: _realStock,
                    productName: _orderItem.productName,
                  );


                  await OrderHelper.addItem(orderItem);
                  AppNavigator.pop();
                },
              )
            ],
          );
        },
      ).symmetricPadding(h: 16, v: 24.0),
    );
  }
}
