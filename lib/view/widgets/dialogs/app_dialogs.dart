/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 19:22
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class AppDialog {
  BuildContext context;
  AppDialog(this.context);

  showCupertinoModalSheet({List<Widget>? actions}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => CupertinoActionSheet(
        actions: actions,
        cancelButton: PrimaryButton(
          label: 'Cancel',
          onPressed: AppNavigator.pop,
          color: AppColors.white,
          textColor: AppColors.black,
        ),
      ),
    );
  }

  Future<void> showSimpleDialog({
    String title = '',
    String contentText = '',
    VoidCallback? onYesPressed,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(contentText),
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            actions: [
              AppTextButton(
                label: AppStrings.no,
                onPressed: AppNavigator.pop,
              ),
              AppTextButton(
                label: AppStrings.yes,
                onPressed: onYesPressed,
              ),
            ],
          );
        });
  }

  Future setBirthDate(TextEditingController controller) async {
    String initialDate = controller.text;

    DateTime? dateTime = await showDatePicker(
      context: context,
      currentDate: AppFormatter.parseDate(initialDate),
      initialDate: AppFormatter.parseDate(initialDate),
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );

    if (dateTime == null) return;
    String date = AppFormatter.formatDate(dateTime, pattern: 'dd.mm.yyyy');
    controller.text = date;
  }
}
