import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pos_mobile/models/product/product_model.dart';
part 'event.dart';
part 'state.dart';

class PurchaseproductListBloc
    extends Bloc<PurchaseproductListEvent, PurchaseproductListState> {
  static List<Product> products = [];
  PurchaseproductListBloc() : super(AddPurchaseInitial()) {
    on<AddPurchesproduct>(addPurchesProduct);
    on<RemovePurchesproduct>(removePurchesProduct);
    on<ClearPurchaseProductList>(_clearPurchaseProductList);
  }
  Future<void> addPurchesProduct(
    AddPurchesproduct event,
    Emitter<PurchaseproductListState> emmit,
  ) async {
    if (products.isEmpty) {
      products.add(event.product);
    }
    {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == event.product.id) {
          products[i] = event.product;
          emmit(AddPurchaseProducts(products));
          return;
        }
      }
      products.add(event.product);
    }
    // products.add(event.product);
    // products = products.toSet().toList();
    emmit(AddPurchaseProducts(products));
  }

  Future<void> removePurchesProduct(
    RemovePurchesproduct event,
    Emitter<PurchaseproductListState> emmit,
  ) async {
    products.removeWhere((element) => element.id == event.product.id);
    emmit(RemovedPurchaseProducts());
  }

  FutureOr<void> _clearPurchaseProductList(
    ClearPurchaseProductList event,
    Emitter emit,
  ) {
    products.clear();
    emit(AddPurchaseInitial());
  }
}
