/*

  Created by: Bakhromjon Polat
  Created on: Mar 07 2023 14:50:20
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/add_purches/bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class PurchaseSmsCheckboxWidget extends StatelessWidget {
  final ValueChanged<bool?> onChanged;
  final bool value;
  const PurchaseSmsCheckboxWidget({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          checkColor: const Color(0xff429A8A),
          fillColor: MaterialStateProperty.all(Colors.white),
          value: value,
          onChanged: onChanged,
        ),
        Text(
          'Смс отправка',
          style: AppTextStyle.medium().copyWith(color: Colors.white),
        ),
        const Spacer(),
        AppTextButton(
          color: AppColors.white,
          label: AppStrings.clear,
          onPressed: () {
            AppDialog dialog = AppDialog(context);
            dialog.showSimpleDialog(
              title: AppStrings.clearProducts,
              contentText: AppStrings.areYouWantToClearList,
              onYesPressed: () {
                PurchaseproductListBloc purchaseproductListBloc =
                    BlocProvider.of(context);
                purchaseproductListBloc.add(ClearPurchaseProductList());
                AppNavigator.pop();
              },
            );
          },
        )
      ],
    );
  }
}
