/*
    Created by: Bakhromjon Polat
    Created on: Dec 30 2022 21:32:52

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/
import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String data;
  final double size;
  const ProductInfo({
    super.key,
    required this.title,
    required this.data,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          size == 16 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text('$title ', style: getTextStyle()),
        Text(data, style: getTextStyle()).wrapExpanded(),
      ],
    );
  }

  TextStyle getTextStyle() => AppTextStyle.semiBold(
        color: size == 16.0 ? AppColors.black : AppColors.darkGrey,
        size: size,
      );
}
