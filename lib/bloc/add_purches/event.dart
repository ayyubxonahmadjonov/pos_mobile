part of 'bloc.dart';

abstract class PurchaseproductListEvent {}

class AddPurchesproduct extends PurchaseproductListEvent {
  final Product product;
  AddPurchesproduct(this.product);
}

class RemovePurchesproduct extends PurchaseproductListEvent {
  final Product product;
  RemovePurchesproduct(this.product);
}

class ClearPurchaseProductList extends PurchaseproductListEvent {}
