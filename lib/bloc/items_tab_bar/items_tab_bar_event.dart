part of 'items_tab_bar_bloc.dart';

@immutable
abstract class ItemsTabBarEvent {}

class ItemsTabBarSetTabControllerEvent extends ItemsTabBarEvent {
  final TabController tabController;
  ItemsTabBarSetTabControllerEvent(this.tabController);
}
