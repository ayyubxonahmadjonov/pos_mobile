/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 11:30:09
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

class ProductDataHeader extends StatelessWidget {
  final String lastString;
  const ProductDataHeader({super.key, required this.lastString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      child: Row(
        children: [
          const Text('№'),
          SizedBox(width: 8.w),
          const Text(AppStrings.name),
          const Spacer(),
          Text(
            AppStrings.quantity,
            style: AppTextStyle.medium(size: 14.0),
          ),
          SizedBox(width: 25.w),
          Text(
            lastString,
            style: AppTextStyle.medium(size: 14.0),
          ),
        ],
      ),
    );
  }
}
