import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class DataWithWiget extends StatelessWidget {
  String? title;
  final Widget child;

  DataWithWiget({
    Key? key,
    this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? "",
            style: AppTextStyle.medium(size: 15, color: AppColors.black),
          ),
        SizedBox(height: 8.h),
        SizedBox(height: 50.h, child: child),
      ],
    );
  }
}
