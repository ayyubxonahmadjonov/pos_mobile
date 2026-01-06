part of 'bloc.dart';

abstract class UpdatePurchaseOrderEvent {}

class StartUpdatePurcheseOrderEvent extends UpdatePurchaseOrderEvent {
  final Purchase purchase;
  final String purchaseId;

  StartUpdatePurcheseOrderEvent({
    required this.purchase,
    required this.purchaseId,
  });
}
