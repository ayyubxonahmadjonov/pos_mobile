/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 10:42:46
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:bloc/bloc.dart';
import 'package:pos_mobile/models/order/order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(NewOrderInitial());
}
