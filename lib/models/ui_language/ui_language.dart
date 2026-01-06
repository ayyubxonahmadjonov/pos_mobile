/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 10:19:05

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';

part 'ui_language.g.dart';

@HiveType(typeId: HiveTypes.uiLanguage, adapterName: HiveAdapters.uiLanguageAdapter)
class UiLanguage {
  UiLanguage({
    String? text,
    String? value,
  }) {
    _text = text;
    _value = value;
  }

  UiLanguage.fromJson(dynamic json) {
    _text = json['text'];
    _value = json['value'];
  }

  @HiveField(0)
  String? _text;
  @HiveField(1)
  String? _value;

  UiLanguage copyWith({
    String? text,
    String? value,
  }) =>
      UiLanguage(
        text: text ?? _text,
        value: value ?? _value,
      );

  String? get text => _text;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['value'] = _value;
    return map;
  }
}
