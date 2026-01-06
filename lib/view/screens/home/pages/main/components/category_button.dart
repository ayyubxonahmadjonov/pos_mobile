/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 12:17:52
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_mobile/core/core.dart';

class CategoryButton extends StatelessWidget {
  final String assetIcon;
  final String label;
  final VoidCallback onPressed;
  const CategoryButton({
    Key? key,
    required this.onPressed,
    required this.assetIcon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightGrey,
        fixedSize: Size(128.w, 130.h),
        shape: AppShapes.simple(radius: 24.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetIcon,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            label,
            style: AppTextStyle.medium(color: AppColors.primary, size: 12.0),
          )
        ],
      ),
    );
  }
}
