part of 'create_order_bloc.dart';

@immutable
abstract class CreateOrderEvent {}

class CreateOrderPressedEvent extends CreateOrderEvent {
  final OrderModel order;
  CreateOrderPressedEvent(this.order);
}
