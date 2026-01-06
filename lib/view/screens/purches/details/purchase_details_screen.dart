/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 11:48:06
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/edit_purches/bloc.dart';
import 'package:pos_mobile/bloc/purchaseDetails/purchase_details_bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/purches/creat_purches/purchase_product_tile.dart';
import 'package:pos_mobile/view/screens/purches/details/components/purchase_details_header.dart';
import 'package:pos_mobile/view/screens/purches/purches.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

import '../../../../bloc/get_supplier/bloc.dart';

class PurchaseDetailsScreen extends StatelessWidget {
  const PurchaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseDetailsBloc, PurchaseDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        PurchaseDetailsBloc detailsBloc = BlocProvider.of(context);
        final purchase = state.purchase;
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: AppBar(
            title: Column(
              children: [
                Text(purchase.pOrder),
                Text(
                  purchase.status,
                  style: AppTextStyle.regular(
                    size: 13.0,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            actions: [
              purchase.status == 'closed'
                  ? const Text('')
                  : AppTextButton(
                      color: AppColors.white,
                      label: AppStrings.edit,
                      onPressed: () {
                        BlocProvider.of<GetSupplierBloc>(context)
                            .add(GetSupplier());
                        BlocProvider.of<EditPurchaseproductListBloc>(context)
                            .add(EditAllPurchesproduct(purchase.items));
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CreateNewPurchase(
                            editC: true,
                            purchaseC: purchase,
                          );
                        })).then((value) {
                          if (value != null) {
                            detailsBloc.add(GetPurchaseDetailsById(purchase));
                          }
                        });
                      },
                    )
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 12.h),
              PurchaseDetailsHeader(purchase: purchase),
              SizedBox(height: 16.h),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    const ProductDataHeader(lastString: "Цена"),
                    const Divider(
                      height: 1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: purchase.items.length,
                        itemBuilder: (context, index) {
                          Product product = purchase.items[index];
                          return PurchaseProductTile(
                            index: index,
                            product: product,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ).wrapExpanded(),
              Container(
                color: AppColors.white,
                margin: EdgeInsets.symmetric(vertical: 7.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.total),
                    Text(AppFormatter.formatNumber(purchase.countTotalPrice())),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: purchase.status == 'closed'
              ? const Text('')
              : Container(
                  color: AppColors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: PrimaryButton(
                    label: AppStrings.receive,
                    onPressed: () {
                      AppNavigator.push(
                        PurchaseEditingScreen(purchase: purchase),
                      ).then((value) {
                        if (value != null) {
                          detailsBloc.add(GetPurchaseDetailsById(purchase));
                        }
                      });
                    },
                  ),
                ),
        ).screenLoading(visible: state is PurchaseDetailsLoadingState);
      },
    );
  }
}
