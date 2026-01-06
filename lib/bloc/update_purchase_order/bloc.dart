import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/purchase/purchase_model.dart';
import '../../services/api_requests.dart';
import '../../services/http_result.dart';

part 'event.dart';
part 'state.dart';

class UpdatePurchaseOrderBloc
    extends Bloc<UpdatePurchaseOrderEvent, UpdatePurchaseOrderState> {
  UpdatePurchaseOrderBloc() : super(UpdatePurchaseOrderInitial()) {
    on<StartUpdatePurcheseOrderEvent>(updatePurches);
  }

//////
  Future<void> updatePurches(
    StartUpdatePurcheseOrderEvent event,
    Emitter<UpdatePurchaseOrderState> emmit,
  ) async {
    emmit(UpdatePurchaseOrderProccesState());
    HttpResult result = await ApiRequests.instance
        .updatePurchase(event.purchase, event.purchaseId);

    if (result.isSuccess) {
      emmit(UpdatePurchaseOrderSuccesState());
    } else {

      emmit(UpdatePurchaseOrderFailure());
    }
  }
}
