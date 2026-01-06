part of 'bloc.dart';

@immutable
abstract class SupplierItemState {}

class SupplierItemInitial extends SupplierItemState {}

class SetSupplierIdName extends SupplierItemState {
  final String supplierName;
  final String supplierSId;
  SetSupplierIdName(this.supplierName, this.supplierSId);
}
