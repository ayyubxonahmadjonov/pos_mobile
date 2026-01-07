/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 11:28:32
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'package:flutter/cupertino.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/barcode/components/barcode_listener_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class CreatingOrderFooter extends StatelessWidget {
  const CreatingOrderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BarcodeListenerWidget(
      from: 'order',
      child: Row(
        children: [
          PrimaryButton(
            label: AppStrings.addOrder,
            onPressed: () {
              AppNavigator.pushNamed(RouteNames.orderItems);
            },
          ).wrapExpanded(),
          SizedBox(width: 14.w),
          RectangularButton(
            color: AppColors.primary,
            icon: CupertinoIcons.add,
            size: 60,
            onTap: () {

            },
          )
        ],
      ).symmetricPadding(h: 16, v: 20),
    );
  }
}
