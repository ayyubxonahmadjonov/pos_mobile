part of 'create_order_bloc.dart';

@immutable
abstract class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}

class CreateOrderSuccessState extends CreateOrderState {
  final OrderModel order;
  CreateOrderSuccessState(this.order);
}

class CreateOrderFailedState extends CreateOrderState {
  final String error;
  CreateOrderFailedState(this.error);
}

class CreateOrderProcessState extends CreateOrderState {}
