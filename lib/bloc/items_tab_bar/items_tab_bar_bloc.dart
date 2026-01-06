/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 11:45
*/

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'items_tab_bar_event.dart';
part 'items_tab_bar_state.dart';

class ItemsTabBarBloc extends Bloc<ItemsTabBarEvent, ItemsTabBarState> {
  late TabController _controller;
  TabController get controller => _controller;
  ItemsTabBarBloc() : super(ItemsTabBarInitial()) {
    on<ItemsTabBarSetTabControllerEvent>(_setController);
  }

  FutureOr<void> _setController(
    ItemsTabBarSetTabControllerEvent event,
    Emitter emit,
  ) {
    _controller = event.tabController;
  }
}
