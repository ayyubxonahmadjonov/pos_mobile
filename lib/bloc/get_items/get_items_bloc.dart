
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

    if (event.isFilter != null && event.isFilter!) {
      emit(ProductLoadingByFilter());
    }


    // Products? result = await ApiRequests.instance.fetchProducts(
    //   event.page ?? 1, // Agar page null bo'lsa, boshidan boshla
    //   event.search,
    //   event.limit ?? 60000, // Barchasini olish uchun katta limit (60k)
    //   event.sortBy,
    //   event.status,
    // );

    // if (result != null && result.data != null && result.data!.isNotEmpty) {
    //   List<Product> products = result.data!
    //       .where((apiProduct) =>
    //           apiProduct.id != null && apiProduct.id!.isNotEmpty)
    //       .map((apiProduct) => Product.fromApiModel(apiProduct))
    //       .toList();

    //   if (products.isNotEmpty) {
    //     await HiveItemsHelper.putAll(products);
    //   } else {
    //     print('⚠️ No valid products to save');
    //   }

    //   emit(GetAllProductsSuccesState());
    // } else {
    //   print('⚠️ No data received from API or data is null');
    //   emit(GetAllProductsFailuressState());
    // }
  }
}


  