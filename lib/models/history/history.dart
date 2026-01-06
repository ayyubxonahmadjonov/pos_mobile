// ignore_for_file: public_member_api_docs, sort_constructors_first

/*

  Created by: Bakhromjon Polat
  Created on: Jan 07 2023 17:29:29
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';

part 'history.g.dart';

@HiveType(typeId: HiveTypes.history, adapterName: HiveAdapters.historyAdapter)
class HistoryModel extends HiveObject {
  @HiveField(0)
  int? _size;

  @HiveField(1)
  int? _date;

  @HiveField(2)
  int? _counted;

  @HiveField(3)
  int? _uncounted;

  @HiveField(4)
  String? _path;

  HistoryModel({
    int? size,
    int? date,
    int? counted,
    int? uncounted,
    String? path,
  }) {
    _counted = counted;
    _date = date;
    _uncounted = uncounted;
    _size = size;
    _path = path;
  }

  HistoryModel copyWith({
    int? size,
    int? date,
    int? counted,
    int? uncounted,
    String? path,
  }) {
    return HistoryModel(
      size: size ?? _size,
      date: date ?? _date,
      counted: counted ?? _counted,
      uncounted: uncounted ?? _uncounted,
      path: path ?? _path,
    );
  }

  int get size => _size ?? 0;
  int get date => _date ?? 0;
  int get counted => _counted ?? 0;
  int get uncounted => _uncounted ?? 0;
  String get path => _path ?? '';

  @override
  String toString() {
    return 'HistoryModel(size: $_size, date: $_date, counted: $_counted, uncounted: $_uncounted)';
  }

  Future<void> add() async => await HiveBoxes.historyBox.add(this);
}
