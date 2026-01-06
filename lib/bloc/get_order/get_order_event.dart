part of 'get_order_bloc.dart';

abstract class GetOrderEvent {}

class GetOrderPaginationEvent extends GetOrderEvent {
  String search;
  GetOrderPaginationEvent({this.search = ""});
}

@immutable
class GetOrderByEmployeeEvent extends GetOrderEvent {
  final Employee employee;
  GetOrderByEmployeeEvent(this.employee);
}

class GetOrderAddNewOrderEvent extends GetOrderEvent {
  final OrderModel order;
  GetOrderAddNewOrderEvent(this.order);
}

class GetOrderByServiceEvent extends GetOrderEvent {
  final EmployeeService service;
  GetOrderByServiceEvent(this.service);
}
