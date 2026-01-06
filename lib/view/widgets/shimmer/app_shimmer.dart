/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:34:19
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class AppShimmer extends StatelessWidget {
  double height;
  double width;

  AppShimmer({Key? key, this.width = 397.0, this.height = 399.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: AppColors.lightGrey,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 6.w),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
