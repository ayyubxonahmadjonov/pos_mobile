/*

  Created by: Bakhromjon Polat
  Created on: Feb 27 2023 16:37:55
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_mobile/hive_helper/order_helper.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/http_result.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitial()) {
    on<CreateOrderPressedEvent>(_createOrder);
  }

  FutureOr<void> _createOrder(
    CreateOrderPressedEvent event,
    Emitter emit,
  ) async {
    emit(CreateOrderProcessState());
    HttpResult result = await ApiRequests.instance.createOrder(event.order);
    if (result.isSuccess) {
      await OrderHelper.deleteOrder();

      OrderModel order = OrderModel.fromJson(result.getData());
      order.itemsCount = event.order.items.length;
      order.acceptItemsCount = 0;

      emit(CreateOrderSuccessState(order));
    } else {
      emit(CreateOrderFailedState(result.getData().toString()));
    }
  }
}
