part of 'get_order_bloc.dart';

abstract class GetOrderState {}

class GetOrderInitial extends GetOrderState {}

class GetOrderProcces extends GetOrderState {}

class GetOrderSuccess extends GetOrderState {
  final List<OrderModel> orderList;

  GetOrderSuccess(this.orderList);
}

class GetOrderFailure extends GetOrderState {}
