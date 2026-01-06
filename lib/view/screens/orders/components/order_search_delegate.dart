/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 11:31:02
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/http_result.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import 'order_list_tile.dart';

class OrderSerachDelegate extends SearchDelegate {
  ApiRequests requests = ApiRequests.instance;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            AppNavigator.pop();
            return;
          }
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _showListView();

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _getFoundOrdersFuture(),
      builder: (context, AsyncSnapshot<List<OrderModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            _getFoundOrders.isEmpty) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            itemBuilder: (context, index) => const SearchShimmer(),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: 20,
          );
        }

        if (snapshot.hasData) {
          return _showListView();
        }

        return const SizedBox();
      },
    );
  }

  ListView _showListView() {
    return ListView.builder(
        itemCount: _getFoundOrders.length,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        itemBuilder: (ctx, index) {
          OrderModel order = _getFoundOrders[index];
          return OrderListTile(order: order);
        });
  }

  List<OrderModel> _getFoundOrders = [];
  List<OrderModel> _setFoundOrders(List<OrderModel> items) =>
      _getFoundOrders = items;

  Future<List<OrderModel>> _getFoundOrdersFuture() async {
    List<OrderModel> orders = [];

    HttpResult result = await requests.getOrders(1, search: query, limit: 100);
    if (result.isSuccess) {
      orders = (result.getData()['data'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
    }

    _setFoundOrders(orders);

    return [];
  }
}
