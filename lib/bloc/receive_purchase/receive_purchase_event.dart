part of 'receive_purchase_bloc.dart';

abstract class ReceivePurchaseEvent extends Equatable {
  const ReceivePurchaseEvent();

  @override
  List<Object> get props => [];
}

class SendReceivedItemsEvent extends ReceivePurchaseEvent {
  final Purchase purchase;
  const SendReceivedItemsEvent(this.purchase);
}
