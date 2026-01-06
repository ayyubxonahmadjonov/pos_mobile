/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 11:53:33
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class RectangularButton extends StatelessWidget {
  VoidCallback? onTap;
  final IconData icon;
  Color color;
  Color? iconColor;
  double size;
  EdgeInsets? margin;

  RectangularButton({
    Key? key,
    this.onTap,
    this.color = AppColors.white,
    required this.icon,
    this.iconColor,
    this.size = 50.0,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.h,
        width: size.w,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
