/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:22:18
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/orders/components/data_with_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import 'components/data_with_title.dart';

// ignore: must_be_immutable
class UpdateOrderPage extends StatefulWidget {
  const UpdateOrderPage({Key? key}) : super(key: key);

  @override
  State<UpdateOrderPage> createState() => _UpdateOrderPageState();
}

class _UpdateOrderPageState extends State<UpdateOrderPage> {
  final TextEditingController _countController = TextEditingController();

  num? _realStock;
  late OrderItem _item;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _item = OrderHelper.currentItem;
    _realStock = _item.realStock;
    _countController.text = _item.orderQuantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.products), actions: [
        AppIconButton(
          color: AppColors.white,
          icon: Icons.tune,
          onPressed: () => _setRemainder(context),
        )
      ]),
      body: Column(
        children: [
          DataWithTitle(
            title: 'Наименование товар',
            data: _item.productName.toString(),
            color: AppColors.lightGrey,
          ),
          DataWithTitle(
            title: AppStrings.stock,
            data: (_item.inStock).toString(),
            color: AppColors.lightGrey,
          ),
          DataWithWiget(
            // autofocus: true,
            title: 'Количество',

            child: AppInputField(
              formatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _countController,
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
            ),
          ),
          SizedBox(height: 24.h),
          PrimaryButton(
            label: AppStrings.save,
            onPressed: () async {
              String count = _countController.text.trim();
              if (count.isEmpty) {
                Fluttertoast.showToast(msg: 'Enter a count');
                return;
              }
              int countNum = int.parse(count);
              OrderItem orderItem = OrderItem(
                barcode: _item.barcode,
                date: DateTime.now().millisecondsSinceEpoch,
                inStock: _item.inStock,
                productId: _item.productId,
                orderQuantity: countNum,
                productName: _item.productName,
                productSku: _item.productSku,
                realStock: _realStock,
              );
              await OrderHelper.addItem(orderItem);
              AppNavigator.pop();
            },
          ),
          SizedBox(height: 12.h),
          PrimaryButton(
            color: AppColors.red,
            label: 'Удалить',
            onPressed: () async {
              await OrderHelper.deleteFromList(_item.productId);
              AppNavigator.pop();
            },
          ),
        ],
      ).symmetricPadding(h: 16),
    );
  }

  Future _setRemainder(BuildContext context) async {
    if (_realStock != null) {
      _countController.text = _realStock.toString();
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Введите остатку'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppInputField(
              hint: (_item.inStock).toString(),
              fillColor: AppColors.fillColor,
              controller: controller,
              action: TextInputAction.done,
              keyboardType: TextInputType.number,
              formatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              label: AppStrings.save,
              onPressed: () {
                String count = controller.text.trim();
                if (count.isNotEmpty) {
                  _realStock = num.parse(count);
                }
                AppNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
