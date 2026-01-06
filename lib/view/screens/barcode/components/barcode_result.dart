/*
    Created by: Bakhromjon Polat
    Created on: Dec 30 2022 10:08:24

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/product_model.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/product_details_screen.dart';
import 'counter_button.dart';
import 'product_info.dart';

import '../../../widgets/widgets.dart';

class BarcodeResult extends StatelessWidget {
  final ProductFromJson product;
  const BarcodeResult({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: ValueListenableBuilder(
          valueListenable: HiveItemsHelper.box.listenable(keys: [product.key]),
          builder: (context, box, w) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name
                        ProductInfo(
                          title: AppStrings.name,
                          data: product.name ?? '',
                          size: 16.0,
                        ),
                        SizedBox(height: 5.h),

                        // Barcode
                        ProductInfo(
                          title: AppStrings.barcode,
                          data: product.barcodes != null ? product.barcodes!.join(', ') : '',
                          size: 13,
                        ),
                        SizedBox(height: 5.h),

                        // SKU
                        ProductInfo(
                          title: AppStrings.sku,
                          data: product.sku.toString(),
                          size: 13,
                        )
                      ],
                    ).wrapExpanded(),
                    Text("")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      '${AppStrings.quantity}: .0',
                      style: AppTextStyle.bold(size: 24),
                    ),
                    Column(
                      children: [
                        // Increment button
                        CounterButton(
                          icon: Icons.add,
                          onPressed: () {
                
                          },
                        ),
                        SizedBox(height: 16.h),

                        // Decrement button
                        CounterButton(
                          icon: Icons.remove,
                          onPressed: () {
                   
                          },
                        ),
                      ],
                    )
                  ],
                ),
                PrimaryButton(
                  label: 'Product sheet',
                  onPressed: () {
                    AppNavigator.push(ProductDetilsScreen(product: product));
                  },
                )
              ],
            );
          }),
    );
  }

  Widget itemInfo(String title, String? titleName, TextStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ',
          style: style,
        ),
        Container(
          decoration: const BoxDecoration(),
          // width: 200.w,
          child: Text(
            '$titleName: ',
            style: style,
          ),
        ),
      ],
    );
  }
}
