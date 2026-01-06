/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:10:13
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class DataWithTitle extends StatelessWidget {
  final String title;
  final String data;
  Color? color;
  DataWithTitle({
    Key? key,
    required this.title,
    required this.data,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.medium(size: 15.0, color: AppColors.black),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(0, 8.h, 0, 20.h),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 50.h,
          width: double.infinity,
          decoration: AppShapes.circular(color: color),
          child: Text(
            data,
            style: AppTextStyle.medium(size: 16.0, color: AppColors.darkGrey),
          ),
        ),
      ],
    );
  }
}
