part of 'order_bloc.dart';

abstract class OrderState {}

class NewOrderInitial extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderUploadedSuccessfullyState extends OrderState {}

class OrderUploadedFaliedState extends OrderState {
  final String message;
  OrderUploadedFaliedState(this.message);
}
