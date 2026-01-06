part of 'purchase_details_bloc.dart';

@immutable
abstract class PurchaseDetailsState {
  final Purchase purchase;
  const PurchaseDetailsState(this.purchase);
}

class PurchaseDetailsInitial extends PurchaseDetailsState {
  const PurchaseDetailsInitial(super.purchase);
}

class PurchaseDetailsLoadingState extends PurchaseDetailsState {
  const PurchaseDetailsLoadingState(super.purchase);
}

class PurchaseSuccessState extends PurchaseDetailsState {
  const PurchaseSuccessState(super.purchase);
}

class PurchaseFailedState extends PurchaseDetailsState {
  final String error;
  const PurchaseFailedState(super.purchase, {required this.error});
}
