part of 'select_service_bloc.dart';

abstract class SelectServiceState {
 
}

class SelectServiceInitial extends SelectServiceState {}
class SetServiceIdName extends SelectServiceState {
  final String serviceName;
  final String serviceSid;
  SetServiceIdName(this.serviceSid, this.serviceName);
}
