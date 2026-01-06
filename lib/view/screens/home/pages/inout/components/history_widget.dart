/*

  Created by: Bakhromjon Polat
  Created on: Jan 07 2023 18:21:30
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/models.dart';

import 'dialog_content.dart';

class HistoryWidget extends StatelessWidget {
  final HistoryModel history;
  final int index;
  const HistoryWidget({
    super.key,
    required this.history,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        title: Text(_getDate(), style: AppTextStyle.semiBold()),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppFormatter.formatBytes(history.size),
              style: AppTextStyle.semiBold(),
            ),
            _showTextRich(
              title: AppStrings.total,
              count: history.counted + history.uncounted,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showTextRich(title: AppStrings.scanned, count: history.counted),
            _showTextRich(
              title: AppStrings.notScanned,
              count: history.uncounted,
            ),
          ],
        ),
        onTap: () {
          if (index == 0) {
            showDialog(
              // barrierDismissible: false,
              context: context,
              builder: (_) => DialogContent(filePath: history.path),
            );
          } else {
            Fluttertoast.showToast(msg: AppStrings.thisFileHasDeleted);
          }
        },
      ),
    );
  }

  Text _showTextRich({required String title, required int count}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title),
          TextSpan(
            text: ' : $count',
            style: AppTextStyle.semiBold(size: 12),
          )
        ],
      ),
      style: AppTextStyle.medium(size: 12.0),
    );
  }

  String _getDate() => AppFormatter.formatDate(
        DateTime.fromMillisecondsSinceEpoch(history.date),
      );
}
