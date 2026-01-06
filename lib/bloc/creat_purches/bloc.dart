import 'package:bloc/bloc.dart';

import '../../models/purchase/purchase_model.dart';
import '../../services/api_requests.dart';
import '../../services/http_result.dart';
part 'event.dart';
part 'state.dart';

class CreatPurchesOrderBloc
    extends Bloc<CreatPurchesOrderEvent, CreatPurchesOrderState> {
  CreatPurchesOrderBloc() : super(CreatPurchesOrderInitial()) {
    on<GetStartCreatPurchesOrderEvent>(creatPurches);
  }

//////
  Future<void> creatPurches(
    GetStartCreatPurchesOrderEvent event,
    Emitter<CreatPurchesOrderState> emit,
  ) async {
    ApiRequests requests = ApiRequests.instance;
    emit(CreatPurchesOrderProccesState());
    HttpResult result = await requests.creatPurchase(event.purchase);

    if (result.isSuccess) {
      emit(CreatPurchesOrderSuccesState());
    } else {
      emit(CreatPurchesOrderFailure());
    }

    emit(CreatPurchesOrderInitial());
  }
}
