part of 'select_service_bloc.dart';

abstract class SelectServiceEvent  {}

class GetServiceIdName extends SelectServiceEvent {
  final String supplierName;
  final String supplierSId;
  GetServiceIdName( {required this.supplierName,required this.supplierSId});
}
