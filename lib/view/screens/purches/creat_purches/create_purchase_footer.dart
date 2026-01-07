/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 12:25:02
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/barcode/components/barcode_listener_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import '../../../../bloc/add_purches/bloc.dart';

class CreatePurchaseFooter extends StatefulWidget {
  final bool? editC;
  const CreatePurchaseFooter({this.editC = false, super.key});

  @override
  State<CreatePurchaseFooter> createState() => _CreatePurchaseFooterState();
}

class _CreatePurchaseFooterState extends State<CreatePurchaseFooter> {
  num calculate() {
    num b = 0;
    for (var a in PurchaseproductListBloc.products) {
      // b = b + ((a.quantity ?? 0) * (a.purchaseCost ?? 0));
    }
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return BarcodeListenerWidget(
      from: 'purchase',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Итого',
                style: AppTextStyle.bold().copyWith(fontSize: 16),
              ),
              Text(
                AppFormatter.formatNumber(calculate()),
                style: AppTextStyle.bold().copyWith(fontSize: 16),
              ),
            ],
          ).symmetricPadding(h: 16.0, v: 0),
          Row(
            children: [
              PrimaryButton(
                label: AppStrings.addOrder,
                onPressed: () {
                  AppNavigator.pushNamed(RouteNames.purchaseProducts,
                          args: widget.editC)
                      .then((value) {});
                },
              ).wrapExpanded(),
              SizedBox(width: 14.w),
              RectangularButton(
                size: 56.0,
                icon: CupertinoIcons.barcode_viewfinder,
                iconColor: AppColors.white,
                color: AppColors.primary,
                onTap: () {

                },
              )
            ],
          ).symmetricPadding(h: 16.0, v: 12.0),
        ],
      ),
    );
  }
}
