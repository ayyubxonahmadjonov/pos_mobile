/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 14:12:29
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile/bloc/add_purches/bloc.dart';
import 'package:pos_mobile/bloc/edit_purches/bloc.dart';
import 'package:pos_mobile/bloc/get_online_product/bloc.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/components.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class AddPurchaseProduct extends StatefulWidget {
  final Product product;
  final bool? dispatch;
  final int? a;

  const AddPurchaseProduct({
    super.key,
    this.a = 1,
    this.dispatch = false,
    required this.product,
  });

  @override
  State<AddPurchaseProduct> createState() => _AddPurchaseProductState();
}

class _AddPurchaseProductState extends State<AddPurchaseProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  late Product product;
  String inStock = '';
  @override
  void initState() {
    super.initState();
    product = widget.product;
    String amount = "0";
    String cost = widget.product.shopPrices?.shId?.retailPrice?.toString() ?? "0";
    _quantityController.text = amount;
    _costController.text = cost;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOnlineProductBloc()..add(GetStartOnlineProductEvent(product.id.toString())),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<GetOnlineProductBloc, GetOnlineProductState>(
          builder: (context, state) {
            if (state is GetOnlineProductsSuccesState) {
              product = state.product;
              _quantityController.text = "0";
              _costController.text = "0";
              _quantityController.selection =
                  const TextSelection(baseOffset: 0, extentOffset: 1);
              // for (int k = 0; k < product.services?.length ?? 0; k++) {
              //   if (product.services?[k]?.service ==
              //       AppPrefs.instance.getServiceId) {
              //     inStock = product.services?[k]?.inStock.toString() ?? '';
              //   }
              // }
            }
            return Stack(
              alignment: Alignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Product name
                      ProductData(
                        title: AppStrings.itemName,
                        data: Text(
                          product.name ?? '',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Divider(height: 40.h),

                      // Product barcode
                      ProductData(
                        title: AppStrings.barcode,
                        data: Text(
                          product.barcode != null ? product.barcode!.join(', ') : '',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Divider(height: 40.h),
                      // Product is stock
                      ProductData(
                        title: 'В наличии',
                        data: Text(
                          inStock,
                          // product.inStock == null
                          //     ? "0"
                          //     : product.inStock.toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Divider(height: 40.h),
                      // Amount
                      ProductData(
                        title: 'Кол-во',
                        data: TextFormField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          textAlign: TextAlign.end,
                          validator: AppValidators.general,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.zero,
                            hintText: '0',
                          ),
                        ),
                      ),
                      Divider(height: 40.h),

                      // Const
                      ProductData(
                        title: 'Цена',
                        data: TextFormField(
                          controller: _costController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          autofocus: true,
                          textAlign: TextAlign.end,
                          validator: AppValidators.general,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          decoration: const InputDecoration(
                            hintText: '0',
                            // hintText: AppStrings.enterRealStock,
                          ),
                        ),
                      ),

                      const Spacer(),
                      PrimaryButton(
                        label: AppStrings.save,
                        onPressed: () {
                          FormState? formState = _formKey.currentState;
                          bool validate = formState?.validate() ?? false;

                          // ! Agar filial yoki yetkazib beruvchi tanlanmagan bo'lsa,
                          // ! return qilib yuboradi.
                          if (!validate) return;

                          num amount = num.parse(_quantityController.text);
                          num cost = num.parse(_costController.text);
                
                          
                          if (widget.dispatch == false) {
                            BlocProvider.of<PurchaseproductListBloc>(context)
                                .add(AddPurchesproduct(product));
                          } else {
                            BlocProvider.of<EditPurchaseproductListBloc>(
                                    context)
                                .add(EditPurchesproduct(product));
                          }
                          int count = 0;

                          Navigator.of(context).popUntil((_) {
                            return count++ >= widget.a!;
                          });
                        },
                      ),
                    ],
                  ).symmetricPadding(h: 16.0, v: 16.0),
                ),
                state is GetOnlineProductsProccesState
                    ? const CircularProgressIndicator(
                        color: Colors.green,
                      )
                    : const Text(""),
              ],
            );
          },
        ),
      ),
    );
  }
}
