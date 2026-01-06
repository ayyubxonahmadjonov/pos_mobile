/*
    Created by: Bakhromjon Polat
    Created on: Dec 30 2022 14:54:52

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_mobile/core/constants/app_colors.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CounterButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: FloatingActionButton(
        onPressed: onPressed,
        heroTag: icon.codePoint.toString(),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }
}
