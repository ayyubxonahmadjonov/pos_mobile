
part of 'pincode_bloc.dart';

abstract class PincodeEvent {}

class PincodeChangedEvent extends PincodeEvent{
  String code;
  PincodeChangedEvent({required this.code});
}