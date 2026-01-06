part of 'bloc.dart';

abstract class GetOnlineProductState {}
class GetOnlineProductInitial extends GetOnlineProductState {}
class GetOnlineProductsProccesState extends GetOnlineProductState {}
class GetOnlineProductsSuccesState extends GetOnlineProductState {
  final Product product;
  GetOnlineProductsSuccesState(this.product);
}
class GetOnlineProductsFailuressState extends GetOnlineProductState {}
