/*
    Created by: Bakhromjon Polat
    Created on: Dec 31 2022 10:07:07

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

class ExcelButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String label;
  const ExcelButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary),
        SizedBox(height: 12.h),
        Text(label, style: AppTextStyle.semiBold()),
      ],
    ).onClick(onTap);
  }
}
