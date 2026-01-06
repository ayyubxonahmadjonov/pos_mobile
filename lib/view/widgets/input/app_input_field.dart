// Created by Bahromjon Po'lat
// Created at 26.08.2022 11:19

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/core/theme/theme.dart';

// ignore: must_be_immutable
class AppInputField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Widget? prefixIcon;
  Widget? suffixIcon;
  List<TextInputFormatter>? formatters;
  TextInputType? keyboardType;
  bool readOnly;
  TextInputAction action;
  TextCapitalization capitalization;
  VoidCallback? onTap;
  int maxLines;
  Color? fillColor;
  FormFieldValidator<String>? validator;
  bool autofocus;

  AppInputField({
    Key? key,
    this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.formatters,
    this.keyboardType,
    this.readOnly = false,
    this.action = TextInputAction.next,
    this.capitalization = TextCapitalization.words,
    this.onTap,
    this.maxLines = 1,
    this.validator,
    this.fillColor,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      validator: validator,
      textInputAction: action,
      textCapitalization: capitalization,
      style: AppTextStyle.medium(size: 16),
      inputFormatters: formatters,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
