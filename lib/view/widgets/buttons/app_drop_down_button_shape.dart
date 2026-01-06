/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:03:06
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class AppDropButtonUI extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  double? width;
  Color? color;
  AppDropButtonUI({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          maxLines: 1,
          style: AppTextStyle.medium(size: 15.0),
        ).wrapExpanded(),
        SizedBox(width: 10.w),
        const Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.primary)
      ],
    ).wrapContainer(color: color).onClick(onPressed);
  }
}
