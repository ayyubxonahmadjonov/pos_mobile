/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:34:24
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_shimmer.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppShimmer(height: 65.0, width: 65.0),
        SizedBox(
          height: 65.h,
          width: 200.w,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppShimmer(height: 32.0),
                AppShimmer(height: 18.0),
              ]),
        ),
        AppShimmer(height: 32.0, width: 52.0),
      ],
    );
  }
}
