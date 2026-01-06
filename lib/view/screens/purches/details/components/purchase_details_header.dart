/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 10:55:50
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_data.dart';

class PurchaseDetailsHeader extends StatelessWidget {
  final Purchase purchase;
  const PurchaseDetailsHeader({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Филиал
          ProductData(
            title: "${AppStrings.branch}:",
            data: _setData(purchase.serviceName),
          ),

          // Поставщик
          ProductData(
            title: "${AppStrings.supplier}:",
            data: _setData(purchase.supplierName),
          ),

          // Создал
          ProductData(
            title: "${AppStrings.created}:",
            data: _setData(purchase.orderedByName),
          ),

          // Дата
          ProductData(
            title: "${AppStrings.date}:",
            data: _setTime(purchase.purchaseOrderDate?.toInt() ?? 0),
          ),

          // Ожидаемая дата
          ProductData(
            title: "${AppStrings.expectedDate}:",
            data: _setTime(purchase.expectedOn?.toInt() ?? 0),
          ),

          // Комментария

          ProductData(
            title: "${AppStrings.comment}:",
            data: _setData(purchase.notes),
          ),
        ],
      ),
    );
  }

  Text _setData(String text) => Text(
        text,
        textAlign: TextAlign.end,
        style: AppTextStyle.semiBold(size: 14.0),
      );
  Text _setTime(int time) => Text(
        AppFormatter.formatDateFromMills(time, pattern: 'dd.mm.yyyy'),
        textAlign: TextAlign.end,
        style: AppTextStyle.semiBold(size: 14.0),
      );
}
