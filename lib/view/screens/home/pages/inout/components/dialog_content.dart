/*
    Created by: Bakhromjon Polat
    Created on: Dec 31 2022 09:58:35

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:share_plus/share_plus.dart';
import 'excel_button.dart';
import 'package:cross_file/cross_file.dart';

class DialogContent extends StatelessWidget {
  final String filePath;
  const DialogContent({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.getExcel),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExcelButton(
            icon: Icons.share_outlined,
            label: AppStrings.share,
            onTap: () async {
              XFile file = XFile(filePath);
              Share.shareXFiles([file]);
              AppNavigator.pop();
            },
          ),
          SizedBox(width: 12.w),
          ExcelButton(
            icon: Icons.upload_file_outlined,
            label: AppStrings.open,
            onTap: () {
              OpenFile.open(filePath);
              AppNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
