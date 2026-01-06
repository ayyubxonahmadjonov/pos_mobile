/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 17:51:57
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/purchaseDetails/purchase_details_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/purches/details/purchase_details_screen.dart';

class PurchaseInfoTile extends StatelessWidget {
  final Purchase purchase;

  const PurchaseInfoTile({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    String purchesTime = AppFormatter.formatDateFromMills(
        purchase.purchaseOrderDate!.toInt(),
        pattern: 'dd.mm.yy');

    String exeptedOn = purchase.expectedOn == 0
        ? ""
        : AppFormatter.formatDate(
            DateTime.fromMillisecondsSinceEpoch(
              purchase.expectedOn?.toInt() ?? 0,
            ),
            pattern: 'dd.mm.yy');
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            buildTitile('№ документ:', purchase.pOrder),
            buildTitile(
              'Дата:',
              '$purchesTime -> $exeptedOn',
            ),
            buildTitile('Статус:',
                purchase.status == 'closed' ? 'закрыто' : "в ожидании"),
            buildTitile('Поставщик:', purchase.supplierName),
            buildTitile('Сумма:', AppFormatter.formatNumber(purchase.total!)),
          ],
        ),
      ).onClick(() {
        PurchaseDetailsBloc purchaseBloc = PurchaseDetailsBloc();

        AppNavigator.push(
          BlocProvider(
            create: (_) => purchaseBloc..add(GetPurchaseDetailsById(purchase)),
            child: const PurchaseDetailsScreen(),
          ),
        );
      }, radius: 10.0),
    );
  }

  Widget buildTitile(
    String title,
    String subttitle,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              AppTextStyle.subtitle().copyWith(color: const Color(0xff444444)),
        ),
        SizedBox(
          width: 220.w,
          child: Text(
            subttitle,
            textAlign: TextAlign.end,
            style: AppTextStyle.subtitle().copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(
                0xff429A8A,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
