
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/product_status.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/sort_by.dart';

part 'get_items_event.dart';
part 'get_items_state.dart';

class GetItemsBloc extends Bloc<GetItemsEvent, GetItemsState> {
  GetItemsBloc() : super(GetItemsInitial()) {
    on<GetAllProductsEvent>(getAllProducts);
  }

Future<void> getAllProducts(
  GetAllProductsEvent event,
  Emitter<GetItemsState> emit,
) async {
  emit(GetAllProductsProccesState());

  int page = 1;
  int totalPage = 1;

  do {
    final Products? result =
        await ApiRequests.instance.fetchProducts(
          page.toString(),
        
        );

    if (result == null || result.data == null) {
      emit(GetAllProductsFailuressState());
      return;
    }

    num totaProductsCount = num.parse(result.total!);
    if (page == 1 && result.total != null) {
      totalPage = (totaProductsCount / 10000).ceil();
    }

    final products = result.data!
        .where((e) => e.id != null && e.id!.isNotEmpty)
        .map((e) => Product.fromApiModel(e))
        .toList();

    if (products.isNotEmpty) {
      await HiveItemsHelper.putAll(products);
    }

    page++;
  } while (page <= totalPage);

  emit(GetAllProductsSuccesState());
}

}


  