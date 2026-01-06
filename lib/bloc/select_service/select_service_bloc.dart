import 'package:bloc/bloc.dart';
part 'select_service_event.dart';
part 'select_service_state.dart';

class SelectServiceBloc extends Bloc<SelectServiceEvent, SelectServiceState> {
  SelectServiceBloc() : super(SelectServiceInitial()) {
    on<GetServiceIdName>(getSupplier);
  }
  Future<void> getSupplier(
    GetServiceIdName event,
    Emitter<SelectServiceState> emmit,
  ) async {
    emmit(SetServiceIdName(event.supplierSId,event.supplierName));
  }
}
