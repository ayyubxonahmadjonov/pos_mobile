/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 14:58:00
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/purches/components/purchase_products_persistant_header.dart';
import 'package:pos_mobile/view/screens/purches/creat_purches/purchase_product_tile.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class PurchaseEditingScreen extends StatefulWidget {
  final Purchase purchase;

  const PurchaseEditingScreen({super.key, required this.purchase});

  @override
  State<PurchaseEditingScreen> createState() => _PurchaseEditingScreenState();
}

class _PurchaseEditingScreenState extends State<PurchaseEditingScreen> {
  late Purchase purchase;

  final List<TextEditingController> _controllers = [];
  @override
  void initState() {
    super.initState();
    purchase = widget.purchase;
    _controllers.addAll(
      purchase.items.map((x) => TextEditingController(text: '0')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReceivePurchaseBloc(),
      child: BlocConsumer<ReceivePurchaseBloc, ReceivePurchaseState>(
        listener: (context, state) {
          if (state is ReceivePurchaseItemsSuccess) {
            AppNavigator.pop("refresh");
          }
          if (state is ReceivePurchaseItemsFailed) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          ReceivePurchaseBloc receivePurchaseBloc = context.read();
          return Scaffold(
            backgroundColor: AppColors.lightGrey,
            // ! AppBar
            appBar: AppBar(
              title: Column(
                children: [
                  Text(purchase.pOrder),
                  Text(
                    purchase.status,
                    style: AppTextStyle.regular(
                      size: 13.0,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton(
                  shape: AppShapes.simple(),
                  onSelected: (value) {
                    switch (value) {
                      case 'mark_all':
                        _markAllReceived();
                        break;
                      default:
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'mark_all',
                        child: Text(AppStrings.markAllReceived),
                      ),
                    ];
                  },
                )
              ],
            ),

            // ! Body
            body: Container(
              color: AppColors.white,
              margin: EdgeInsets.symmetric(vertical: 12.h),
              child: CustomScrollView(slivers: [
                SliverPersistentHeader(delegate: PurchasePersistentHeader()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Product product = purchase.items[index];
                      return PurchaseProductTile.withTextField(
                        index: index,
                        product: product,
                        textEditingController: _controllers[index],
                      );
                    },
                    childCount: purchase.items.length,
                  ),
                ),
              ]),
            ),
            bottomNavigationBar: Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: PrimaryButton(
                label: AppStrings.complete,
                onPressed: () {
                  for (var i = 0; i < _controllers.length; i++) {
                    num quantity = num.parse(_controllers[i].text);

                  }

                  receivePurchaseBloc.add(SendReceivedItemsEvent(purchase));
                },
              ),
            ),
          ).screenLoading(visible: state is ReceivePurchaseItemsLoading);
        },
      ),
    );
  }

  void _markAllReceived() {
    for (var i = 0; i < purchase.items.length; i++) {
      Product product = purchase.items[i];
      // _controllers[i].text = (product.quantity ?? 0).toString();
    }
  }
}
