/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 17:43:36
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class AppProgressIndicator extends StatelessWidget {
  final num max;
  num value;
  AppProgressIndicator({
    Key? key,
    required this.max,
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: _getPercent,
            color: AppColors.primary,
            backgroundColor: AppColors.red,
          ),
          Text(
            '$value/$max',
            style: AppTextStyle.medium(size: 12),
          )
        ],
      ),
    );
  }

  double get _getPercent => 100 * value / max / 100;
}
