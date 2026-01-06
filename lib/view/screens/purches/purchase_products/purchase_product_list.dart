/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 12:45:53
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/constants/app_strings.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/components.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class PurchaseProductListScreen extends StatelessWidget {
  final bool? editC;
  const PurchaseProductListScreen({super.key, required this.editC});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.products),
        actions: [
          AppIconButton(
            icon: Icons.search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  editC: editC,
                  screenEnum: ProductScreenEnum.purchase,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: HiveItemsHelper.box.length,
        itemBuilder: (context, index) {
          Product product = HiveItemsHelper.box.getAt(index)!;
          return ItemsListTile(
            product: product,
            isPurchase: true,
            screen: ProductScreenEnum.purchase,
            editC: editC,
            a: 2,
          );
        },
      ),
    );
  }
}
