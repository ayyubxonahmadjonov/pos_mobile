part of 'purchase_details_bloc.dart';

@immutable
abstract class PurchaseDetailsEvent {}

class GetPurchaseDetailsById extends PurchaseDetailsEvent {
  final Purchase purchase;
  GetPurchaseDetailsById(this.purchase);
}
