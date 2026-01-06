import 'package:bloc/bloc.dart';
import 'package:pos_mobile/models/product/product_model.dart';
part 'event.dart';
part 'state.dart';

class EditPurchaseproductListBloc
    extends Bloc<EditPurchaseproductListEvent, EditPurchaseproductListState> {
  static List<Product> editingProducts = [];
  EditPurchaseproductListBloc() : super(EditPurchaseInitial()) {
    on<EditPurchesproduct>(editPurchesProduct);
    on<EditAllPurchesproduct>(editAllPurchesProduct);
    on<EditRemovePurchesproduct>(removePurchesProduct);
  }
  Future<void> editPurchesProduct(
    EditPurchesproduct event,
    Emitter<EditPurchaseproductListState> emmit,
  ) async {
    // editingProducts.add(event.product);
    // editingProducts = editingProducts.toSet().toList();
    {
      for (int i = 0; i < editingProducts.length; i++) {
        if (editingProducts[i].id == event.product.id) {
          editingProducts[i] = event.product;
          emmit(EditPurchaseProducts());
          return;
        }
      }
      editingProducts.add(event.product);
    }
    emmit(EditPurchaseProducts());
  }

  Future<void> editAllPurchesProduct(
    EditAllPurchesproduct event,
    Emitter<EditPurchaseproductListState> emmit,
  ) async {
    editingProducts = (event.product);
    editingProducts = editingProducts.toSet().toList();
    emmit(EditPurchaseProducts());
  }

  Future<void> removePurchesProduct(
    EditRemovePurchesproduct event,
    Emitter<EditPurchaseproductListState> emmit,
  ) async {
    editingProducts.removeWhere((element) => element.id == event.product.id);
    emmit(RemovedPurchaseProducts());
  }
}
