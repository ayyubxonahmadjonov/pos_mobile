/* 
    Created by Bahromjon Po'lat
    Created at 30.08.2022 18:39
*/

import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SimpleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
