/*
  Created by: Azizbek
  Created on: Mar 01 2023 14:37:34
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv
  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/services/api_requests.dart';

import '../../../../models/purchase/purchase_model.dart';
import '../../../../services/http_result.dart';
import '../../../widgets/shimmer/search_shimmer.dart';
import '../components/purchase_info_tile.dart';

class PurchaseSerachDelegate extends SearchDelegate {
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
      builder: (context, AsyncSnapshot<List<Purchase>> snapshot) {
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
        padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 10.w, ),
        itemBuilder: (ctx, index) {
          Purchase purchase = _getFoundOrders[index];
          return PurchaseInfoTile(purchase: purchase);
        });
  }

  List<Purchase> _getFoundOrders = [];
  List<Purchase> _setFoundOrders(List<Purchase> items) =>
      _getFoundOrders = items;

  Future<List<Purchase>> _getFoundOrdersFuture() async {
    List<Purchase> orders = [];

    HttpResult result = await requests.getPurchaseList(page:1, search: query, limit: 100);
    if (result.isSuccess) {
      orders = (result.getData()['data'] as List)
          .map((e) => Purchase.fromJson(e))
          .toList();
    }

    _setFoundOrders(orders);

    return [];
  }



}
