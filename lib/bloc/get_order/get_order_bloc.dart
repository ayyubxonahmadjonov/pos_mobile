/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 12:40:28
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/services/services.dart';

part 'get_order_event.dart';
part 'get_order_state.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  final List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;
  bool _finished = false;
  bool get finished => _finished;
  int _page = 1;
  bool isLoading = false;
  Employee _employee = Employee(id: "", name: AppStrings.all);
  Employee get employee => _employee;
  EmployeeService _service = EmployeeService(
    id: "",
    service: "",
    serviceName: AppStrings.all,
  );
  EmployeeService get service => _service;
  GetOrderBloc() : super(GetOrderInitial()) {
    on<GetOrderPaginationEvent>(_fetchOrders);
    on<GetOrderByEmployeeEvent>(_getOrderByEmployee);
    on<GetOrderAddNewOrderEvent>(_insertOrder);
    on<GetOrderByServiceEvent>(_getOrderByService);
  }

  Future<void> _fetchOrders(
    GetOrderPaginationEvent event,
    Emitter<GetOrderState> emit,
  ) async {
    if (isLoading || _finished) return;

    emit(GetOrderProcces());
    isLoading = true;
    HttpResult result = await ApiRequests.instance.getOrders(
      _page,
      search: event.search,
    );
    if (result.isSuccess) {
      List<OrderModel> orderList = (result.getData()['data'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();

      if (orderList.length < 20) {
        _finished = true;
      }
      _page++;
      _orderList.addAll(orderList);

      emit(GetOrderSuccess(_orderList));
    } else {
      emit(GetOrderFailure());
    }
    isLoading = false;
  }

  FutureOr<void> _getOrderByEmployee(
    GetOrderByEmployeeEvent event,
    Emitter<GetOrderState> emit,
  ) {
    _employee = event.employee;
    emit(GetOrderSuccess(_orderList));
  }

  FutureOr<void> _getOrderByService(
    GetOrderByServiceEvent event,
    Emitter emit,
  ) {
    _service = event.service;
    emit(GetOrderSuccess(_orderList));
  }

  FutureOr<void> _insertOrder(
    GetOrderAddNewOrderEvent event,
    Emitter emit,
  ) {
    _orderList.insert(0, event.order);
    emit(GetOrderSuccess(_orderList));
  }
}
