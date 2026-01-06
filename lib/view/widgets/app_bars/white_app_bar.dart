/*

  Created by: Bakhromjon Polat
  Created on: Jan 05 2023 11:09:50
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/core/constants/app_colors.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      iconTheme: const IconThemeData(color: AppColors.black),
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
