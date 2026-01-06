/// Created by Bahromjon Po'lat
/// Created at 26.08.2022 11:11

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/theme/theme.dart';

class AppTitle extends StatelessWidget {
  final String title;
  const AppTitle(this.title,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.bold(),
    );
  }
}