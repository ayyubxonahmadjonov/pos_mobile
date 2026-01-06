/* 
    Created by Bahromjon Po'lat
    Created at 26.08.2022 16:18
*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';

part 'pincode_event.dart';
part 'pincode_state.dart';

class PincodeBloc extends Bloc<PincodeEvent, PincodeState> {
  PincodeBloc() : super(PincodeChangingState(pincode: '')) {
    on<PincodeChangedEvent>(_onPinChanged);
  }

  FutureOr<void> _onPinChanged(
    PincodeChangedEvent event,
    Emitter<PincodeState> emit,
  ) async {
    emit(PincodeChangingState(pincode: event.code));

    if (event.code.length < 4) {
      return;
    }

    final employeeList = EmployeeHelper.getEmployeeList();

    emit(PincodeChangingState(pincode: event.code));
    bool isTrue = false;

    for (var employee in employeeList) {
      if (employee.password == event.code) {
        isTrue = true;
        await EmployeeHelper.setCurrntEmployee(employee.copyWith());
        break;
      }
    }
    if (isTrue) {
      emit(PincodeSuccessState());
    } else {
      await HapticFeedback.heavyImpact();
      emit(PincodeFailureState());
      emit(PincodeChangingState(pincode: ''));
    }
  }
}
