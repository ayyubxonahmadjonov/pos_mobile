part of 'bloc.dart';


abstract class SupplierItemEvent {}
class GetSupplierIdName extends SupplierItemEvent{
  final String supplierName;
  final String supplierSId;

  GetSupplierIdName(this.supplierName, this.supplierSId);
}