/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 11:18:29
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 


*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/constants/constants.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/components.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.products),
        actions: [
          AppIconButton(
            icon: Icons.search,
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: ProductSearchDelegate(
              //     screenEnum: ProductScreenEnum.order,
              //   ),
              // );
            },
          ),
        ],
      ),
      body: ProductList(
        products: HiveItemsHelper.box.values.toList(),
        screenEnum: ProductScreenEnum.order,
      ),
    );
  }
}
