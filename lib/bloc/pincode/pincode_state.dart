
part of 'pincode_bloc.dart';

abstract class PincodeState {}

class PincodeInitial extends PincodeState {}

class PincodeChangingState extends PincodeState {
  String pincode;
  PincodeChangingState({required this.pincode});
}

class PincodeSuccessState extends PincodeState {}

class PincodeFailureState extends PincodeState {}