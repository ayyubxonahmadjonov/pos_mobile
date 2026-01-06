import 'package:bloc/bloc.dart';
import 'package:pos_mobile/models/service_list/service_list.dart';
import 'package:pos_mobile/models/supplier_list/supplier_list.dart';
import '../../services/api_requests.dart';
import '../../services/http_result.dart';
part 'event.dart';
part 'state.dart';

class GetSupplierBloc extends Bloc<GetSupplierEvent, GetSupplierState> {
  GetSupplierBloc() : super(GetSupplierInitial()) {
    on<GetSupplier>(getSupplier);
  }
  Future<void> getSupplier(
    GetSupplier event,
    Emitter<GetSupplierState> emmit,
  ) async {
    emmit(GetSupplierProccesState());
    HttpResult result1 = await ApiRequests.instance.getSupplier();
    HttpResult result2 = await ApiRequests.instance.getService();
    if (result1.isSuccess && result2.isSuccess) {
      List<SupplierList> supplierListList = (result1.getData() as List)
          .map((e) => SupplierList.fromJson(e))
          .toList();
      List<ServiceList> serviceListList = (result2.getData() as List)
          .map((e) => ServiceList.fromJson(e))
          .toList();
      emmit(GetSupplierSuccesState(supplierListList, serviceListList));
    } else {
      emmit(GetSupplierFailure());
    }
  }
}
