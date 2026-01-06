part of 'get_items_bloc.dart';

abstract class GetItemsEvent {}
class GetAllProductsEvent extends GetItemsEvent{



}
class LoadMoreProductsEvent extends GetItemsEvent {
  
}
class RefreshProductsEvent extends GetItemsEvent {
  
}
