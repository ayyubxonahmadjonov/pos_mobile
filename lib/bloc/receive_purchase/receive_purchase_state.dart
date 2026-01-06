part of 'receive_purchase_bloc.dart';

abstract class ReceivePurchaseState extends Equatable {
  const ReceivePurchaseState();

  @override
  List<Object> get props => [];
}

class ReceivePurchaseInitial extends ReceivePurchaseState {}

class ReceivePurchaseItemsSuccess extends ReceivePurchaseState {}

class ReceivePurchaseItemsFailed extends ReceivePurchaseState {
  final String error;
  const ReceivePurchaseItemsFailed(this.error);
}

class ReceivePurchaseItemsLoading extends ReceivePurchaseState {}
