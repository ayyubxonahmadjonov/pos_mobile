import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SupplierItemBloc extends Bloc<SupplierItemEvent, SupplierItemState> {
  SupplierItemBloc() : super(SupplierItemInitial()) {
    on<GetSupplierIdName>(getSupplier);
  }
  Future<void> getSupplier(
    GetSupplierIdName event,
    Emitter<SupplierItemState> emmit,
  ) async {
    emmit(SetSupplierIdName(event.supplierName, event.supplierSId));
  }
}
