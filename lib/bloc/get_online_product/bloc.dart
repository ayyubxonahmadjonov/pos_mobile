import 'package:bloc/bloc.dart';
import 'package:pos_mobile/models/models.dart';
import '../../services/api_requests.dart';
import '../../services/http_result.dart';
part 'event.dart';
part 'state.dart';

class GetOnlineProductBloc
    extends Bloc<GetOnlineProductEvent, GetOnlineProductState> {
  GetOnlineProductBloc() : super(GetOnlineProductInitial()) {
    on<GetStartOnlineProductEvent>(getOnlineProduct);
  }
  Future<void> getOnlineProduct(
    GetStartOnlineProductEvent event,
    Emitter<GetOnlineProductState> emmit,
  ) async {
    emmit(GetOnlineProductsProccesState());
    HttpResult result =
        await ApiRequests.instance.getOnlineItems(event.productId);

    if (result.isSuccess) {
      Product product = Product.fromJson(result.getData());

      emmit(GetOnlineProductsSuccesState(product));
    } else {
      emmit(GetOnlineProductsFailuressState());
    }
  }
}
