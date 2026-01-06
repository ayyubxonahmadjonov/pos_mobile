part of 'bloc.dart';

abstract class GetSupplierState {}

class GetSupplierInitial extends GetSupplierState {}

class GetSupplierProccesState extends GetSupplierState {}

class GetSupplierSuccesState extends GetSupplierState {
  final List<SupplierList> list1;

  final List<ServiceList> list2;

  GetSupplierSuccesState( this.list1, this.list2);
}

class GetSupplierFailure extends GetSupplierState {}
