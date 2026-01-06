part of 'bloc.dart';

abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseProcces extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {
  final List<Purchase> purchaseList;

  PurchaseSuccess(this.purchaseList);
}

class PurchaseFailure extends PurchaseState {}
