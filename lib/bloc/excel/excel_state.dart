part of 'excel_bloc.dart';

abstract class ExcelState {}

class ExcelInitial extends ExcelState {}

class ExcelProcessingState extends ExcelState {}

class ExcelSuccessState extends ExcelState {
  final String excelFile;
  ExcelSuccessState(this.excelFile);
}

class ExcelFailedState extends ExcelState {
  final String error;
  ExcelFailedState(this.error);
}
