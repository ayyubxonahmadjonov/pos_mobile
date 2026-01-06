part of 'bloc.dart';

abstract class PurchaseproductListState {}

class AddPurchaseInitial extends PurchaseproductListState {}

class AddPurchaseProducts extends PurchaseproductListState {
   final List<Product> products;

  AddPurchaseProducts(this.products);
}

class RemovedPurchaseProducts extends PurchaseproductListState {
}
