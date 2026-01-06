/*

  Created by: Bakhromjon Polat
  Created on: Mar 01 2023 12:07:29
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/http_result.dart';

part 'receive_purchase_event.dart';
part 'receive_purchase_state.dart';

class ReceivePurchaseBloc
    extends Bloc<ReceivePurchaseEvent, ReceivePurchaseState> {
  ReceivePurchaseBloc() : super(ReceivePurchaseInitial()) {
    on<SendReceivedItemsEvent>(_receiveItems);
  }

  FutureOr<void> _receiveItems(
    SendReceivedItemsEvent event,
    Emitter emit,
  ) async {
    ApiRequests requests = ApiRequests.instance;
    String purchaseId = event.purchase.id.toString();
    emit(ReceivePurchaseItemsLoading());
    HttpResult result  = HttpResult(statusCode: 1, response: 1);

    if (result.isSuccess) {
      emit(ReceivePurchaseItemsSuccess());
    } else {
      emit(ReceivePurchaseItemsFailed(result.getData().toString()));
    }
  }
}
