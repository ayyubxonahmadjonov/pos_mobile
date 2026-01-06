/// Created by Bahromjon Po'lat
/// Created at 26.08.2022 10:17

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  Color? color;
  Color? textColor;
  bool isLoading;
  bool isActive;

  PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isLoading = false,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shadowColor: isActive ? null : Colors.transparent,
      ),
      child: isLoading
          ? const Center(child: CupertinoActivityIndicator())
          : Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}
