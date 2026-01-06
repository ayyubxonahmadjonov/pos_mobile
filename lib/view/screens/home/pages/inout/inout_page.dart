/* 
    Created by Bahromjon Po'lat
    Created at 30.08.2022 18:53
*/

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'components/get_excel_button.dart';
import 'components/history_widget.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class InOutPage extends StatelessWidget {
  const InOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: AppStrings.inOut),
      floatingActionButton: const GetExcelButton(),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.historyBox.listenable(),
        builder: (context, Box<HistoryModel> box, child) {
          List<HistoryModel> histories = box.values.toList().reversed.toList();

          return ListView.separated(
            itemCount: histories.length,
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemBuilder: (context, index) {
              HistoryModel history = histories[index];
              return HistoryWidget(history: history, index: index);
            },
          );
        },
      ),
    );
  }
}
