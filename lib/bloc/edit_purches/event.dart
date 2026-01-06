part of 'bloc.dart';

abstract class EditPurchaseproductListEvent {}
class EditPurchesproduct extends EditPurchaseproductListEvent {
  final Product product;
  EditPurchesproduct(this.product);
}
class EditAllPurchesproduct extends EditPurchaseproductListEvent {
  final List<Product> product;
  EditAllPurchesproduct(this.product);
}

class EditRemovePurchesproduct extends EditPurchaseproductListEvent {
  final Product product;
  EditRemovePurchesproduct(this.product);
}
