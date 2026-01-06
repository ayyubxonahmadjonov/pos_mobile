import 'package:bloc/bloc.dart';
import 'package:pos_mobile/services/services.dart';

import '../../models/purchase/purchase_model.dart';
part 'event.dart';
part 'state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final List<Purchase> _purchaseList = [];
  List<Purchase> get purchaseList => _purchaseList;
  bool _finished = false;
  bool get finished => _finished;
  int _page = 1;
  bool isLoading = false;
  PurchaseBloc() : super(PurchaseInitial()) {
    on<GetStartPurchaseEvet>(_getPurchase);
  }

  Future<void> _getPurchase(
    GetStartPurchaseEvet event,
    Emitter<PurchaseState> emit,
  ) async {
    if (isLoading || _finished) return;
    emit(PurchaseProcces());
    isLoading = true;
    HttpResult result = await ApiRequests.instance.getPurchaseList(page: _page);

    if (result.isSuccess) {
      List<Purchase> purchaseList = (result.getData()['data'] as List)
          .map((e) => Purchase.fromJson(e))
          .toList();

      if (purchaseList.length < 20) {
        _finished = true;
      }
      _page++;
      _purchaseList.addAll(purchaseList);

      emit(PurchaseSuccess(_purchaseList));
    } else {
      emit(PurchaseFailure());
    }
    isLoading = false;
  }
}
