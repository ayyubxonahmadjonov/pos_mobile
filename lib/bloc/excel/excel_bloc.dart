/*
    Created by: Bakhromjon Polat
    Created on: Dec 31 2022 09:45:29

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_mobile/services/excel_service.dart';

part 'excel_event.dart';
part 'excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  ExcelBloc() : super(ExcelInitial()) {
    on<GetExcelEvent>(_getExcel);
  }

  FutureOr<void> _getExcel(
    GetExcelEvent event,
    Emitter emit,
  ) async {
    emit(ExcelProcessingState());
    String filePath = await ExcelService().createExcelFile();
    emit(ExcelSuccessState(filePath));
  }
}
