/*

  Created by: Azizbek
  Created on: Feb 22 2023 12:54:26
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/bloc/get_supplier/bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/purchase/purchase_model.dart';
import 'package:pos_mobile/view/screens/purches/components/items_appbar.dart';
import 'package:pos_mobile/view/screens/purches/components/purchase_info_tile.dart';
import '../../../routes/routes.dart';


class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PurchaseBloc>(context).add(GetStartPurchaseEvet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PurchesItemsAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BlocBuilder<PurchaseBloc, PurchaseState>(
                  builder: (context, state) {
                    PurchaseBloc purchaseBloc = BlocProvider.of(context);

                    if (purchaseBloc.purchaseList.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: purchaseBloc.purchaseList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == purchaseBloc.purchaseList.length) {
                          purchaseBloc.add(GetStartPurchaseEvet());
                          return Container(
                            height: 56.h,
                            width: 56.w,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ).visibility(visible: !purchaseBloc.finished);
                        }
                        Purchase purchase = purchaseBloc.purchaseList[index];
                        return PurchaseInfoTile(purchase: purchase);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 80,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<GetSupplierBloc>(context)
                            .add(GetSupplier());
                        AppNavigator.pushNamed(RouteNames.purchaseCreat);
                      },
                      child: const Text(AppStrings.newOrder)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
