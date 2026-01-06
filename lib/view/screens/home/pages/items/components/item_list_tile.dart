/*
    Created by: Bakhromjon Polat
    Created on: Aug 30 2022 18:59:03

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/product_details_screen.dart';
import 'package:pos_mobile/view/screens/orders/orders.dart';
import 'package:pos_mobile/view/screens/purches/purches.dart';

// ignore: must_be_immutable
class ItemsListTile extends StatelessWidget {
  final Product product;
  final ProductScreenEnum screen;
  bool isScanned;
  bool isPurchase;
  final bool? editC;
  int? a;
  ItemsListTile({
    Key? key,
    this.editC = false,
    required this.a,
    required this.product,
    required this.screen,
    this.isScanned = false,
    this.isPurchase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: AppImage(imageUrl: '#'),
      title: Text(product.name ?? ''),
      subtitle: Text(product.barcode?.join(', ') ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(product.measurementValues?.shopId?.amount.toString() ?? '-'),
        ],
      ),
      onTap: () async {
        switch (screen) {
          case ProductScreenEnum.inventory:
            AppNavigator.push(ProductDetilsScreen(product: product));

            break;
          case ProductScreenEnum.purchase:
            {
              // BlocProvider.of<GetOnlineProductBloc>(context)
              //     .add(GetStartOnlineProductEvent(
              //   product.id.toString(),
              // ));
              AppNavigator.push(AddPurchaseProduct(
                product: product,
                dispatch: editC,
                a: a,
              ));
            }

            break;
          case ProductScreenEnum.order:
            OrderHelper.setCurrentItem = OrderItem.fromProduct(product);
            AppNavigator.push(const OrderCountPage());
            break;
        }
      },
    );
  }
}

enum ProductScreenEnum { inventory, purchase, order }