/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 14:38:09

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

class ProductData extends StatelessWidget {
  final String title;
  final Widget data;
  const ProductData({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.semiBold(size: 14.0),
        ).wrapExpanded(flex: 1),
        data.wrapExpanded(flex: 2),
      ],
    );
  }
}
