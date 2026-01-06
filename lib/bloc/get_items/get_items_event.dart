part of 'get_items_bloc.dart';

abstract class GetItemsEvent {}
class GetAllProductsEvent extends GetItemsEvent{
  final int page;
  final String search;
  final int limit;
  final SortBy sortBy;
  final ProductsStatus status;
   bool? isFilter = false;

  GetAllProductsEvent({
    this.page = 1,
    this.search = '',
    this.limit = 50,
    this.sortBy = SortBy.empty,
    this.status = ProductsStatus.all,
    this.isFilter = false,
  });

}
class LoadMoreProductsEvent extends GetItemsEvent {
  
}
class RefreshProductsEvent extends GetItemsEvent {
  
}
