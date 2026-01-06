/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 11:38
*/

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  Color? color;
  AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: color,
      icon: Icon(icon),
    );
  }
}
