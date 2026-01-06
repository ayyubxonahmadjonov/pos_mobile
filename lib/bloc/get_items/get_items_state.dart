part of 'get_items_bloc.dart';

abstract class GetItemsState {}

class GetItemsInitial extends GetItemsState {}

class GetAllProductsProccesState extends GetItemsState {}

class GetAllProductsSuccesState extends GetItemsState {

}


class GetAllProductsFailuressState extends GetItemsState {}

class ProductLoadingByFilter extends GetItemsState {}