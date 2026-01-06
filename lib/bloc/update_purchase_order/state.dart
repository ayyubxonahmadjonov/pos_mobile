part of 'bloc.dart';

@immutable
abstract class UpdatePurchaseOrderState {}

class UpdatePurchaseOrderInitial extends UpdatePurchaseOrderState {}
class UpdatePurchaseOrderProccesState extends UpdatePurchaseOrderState {}

class UpdatePurchaseOrderSuccesState extends UpdatePurchaseOrderState {}

class UpdatePurchaseOrderFailure extends UpdatePurchaseOrderState {}
