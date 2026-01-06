/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 11:55:18
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/http_result.dart';

part 'purchase_details_event.dart';
part 'purchase_details_state.dart';

class PurchaseDetailsBloc
    extends Bloc<PurchaseDetailsEvent, PurchaseDetailsState> {
  PurchaseDetailsBloc() : super(PurchaseDetailsInitial(Purchase())) {
    on<GetPurchaseDetailsById>(_getPurchaseOrderById);
  }

  FutureOr<void> _getPurchaseOrderById(
    GetPurchaseDetailsById event,
    Emitter emit,
  ) async {
    emit(PurchaseDetailsLoadingState(event.purchase));
    String id = event.purchase.id ?? "";
    HttpResult result = await ApiRequests.instance.getPurchaseOrderById(id);
    if (result.isSuccess) {
      Purchase purchase = Purchase.fromJson(result.getData());
      emit(PurchaseSuccessState(purchase));
    } else {
      emit(
        PurchaseFailedState(
          event.purchase,
          error: result.getData().toString(),
        ),
      );
    }
  }
}
