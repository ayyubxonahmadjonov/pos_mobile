part of 'order_bloc.dart';

abstract class OrderEvent {}

class OrderLoadedEvent extends OrderEvent {}

class ItemAddedIntoOrder extends OrderEvent {
  final OrderItem item;
  ItemAddedIntoOrder(this.item);
}

class NewOderDateChanged extends OrderEvent {
  final DateTime dateTime;
  NewOderDateChanged(this.dateTime);
}

class NewOrderWarehouseSelected extends OrderEvent {
  final String warehouse;
  NewOrderWarehouseSelected(this.warehouse);
}

class NewOrderItemCountIncuded extends OrderEvent {
  final OrderItem item;
  NewOrderItemCountIncuded({required this.item});
}

class NewOrderRealStockWritten extends OrderEvent {
  final int realStock;
  NewOrderRealStockWritten({required this.realStock});
}

class OrderSelected extends OrderEvent {
  final OrderModel order;
  OrderSelected(this.order);
}

class OrderItemSelected extends OrderEvent {
  final OrderItem orderItem;
  OrderItemSelected(this.orderItem);
}

class OrderEmployeeSelected extends OrderEvent {
  final String employee;
  OrderEmployeeSelected(this.employee);
}

class OrderInStockSwitched extends OrderEvent {
  final bool value;
  OrderInStockSwitched(this.value);
}

class OrderCompleted extends OrderEvent {}
