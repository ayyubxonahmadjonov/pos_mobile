import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  bool isLoading;
  Color? color;
  AppTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: Text(
        label,
        style: TextStyle(color: color),
      ),
    );
  }
}
