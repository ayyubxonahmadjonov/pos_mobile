/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 18:47
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/core/core.dart';

// ignore: must_be_immutable
class InputWithTitle extends StatelessWidget {
  final String title;
  TextEditingController? controller;
  String? hint;
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

  InputWithTitle({
    Key? key,
    required this.title,
    this.controller,
    this.hint,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      // enabled: enabled,
      
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
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
        hintText: hint,
        fillColor: fillColor,
        filled: false,
        suffixIcon: suffixIcon,
        prefixIcon: Container(
          width: 80.w,
          alignment: Alignment.centerLeft,
          child: Text(title)),
        border: _inputBorder,
        errorBorder: _inputBorder,
        enabledBorder: _inputBorder,
        focusedBorder: _inputBorder,
        disabledBorder: _inputBorder,
        focusedErrorBorder: _inputBorder
      ),
    );
  }

  UnderlineInputBorder get _inputBorder =>  UnderlineInputBorder(
    borderSide: BorderSide(width: 0.5.w)
  );
}
