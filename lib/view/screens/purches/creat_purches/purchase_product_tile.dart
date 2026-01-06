/*
  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 16:51:00
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat
  Documentation: 
*/
import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile/view/screens/purches/creat_purches/add_purchase_product.dart';
import '../../../../bloc/add_purches/bloc.dart';
import '../../../../bloc/edit_purches/bloc.dart';

// ignore: must_be_immutable
class PurchaseProductTile extends StatelessWidget {
  final int index;
  final Product product;
  bool clickable;
  bool _withTextField = false;
  bool isAction;
  bool isEditing;
  TextEditingController? textEditingController;
  PurchaseProductTile({
    Key? key,
    required this.index,
    required this.product,
    this.isAction = false,
    this.clickable = false,
    this.isEditing = false,
  }) : super(key: key);

  PurchaseProductTile.withTextField({
    super.key,
    required this.index,
    required this.product,
    this.clickable = false,
    this.textEditingController,
    this.isAction = false,
    this.isEditing = false,
  }) {
    _withTextField = true;
  }

  @override
  Widget build(BuildContext context) {
    PurchaseproductListBloc bloc1 = BlocProvider.of(context);
    EditPurchaseproductListBloc bloc2 = BlocProvider.of(context);

    void showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.white,
            duration: const Duration(milliseconds: 350),
            content: Center(
                child: Text(
              message,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ))),
      );
    }

    return InkWell(
      onTap: () {
        if (clickable) {
          // AppNavigator.push(AddPurchaseProduct(
          //   product: product,
          //   dispatch: isEditing,
          // ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: Slidable(
          endActionPane: isAction == false
              ? null
              : ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: .2,
                  children: [
                    SlidableAction(
                      padding: const EdgeInsets.all(5.0),
                      borderRadius: BorderRadius.circular(5),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      spacing: 6,
                      autoClose: true,
                      icon: Icons.delete,
                      onPressed: (_) {
                        isEditing == false
                            ? bloc1.add(RemovePurchesproduct(product))
                            : bloc2.add(EditRemovePurchesproduct(product));
                        showSnackBar('Удален');
                      },
                    ),
                  ],
                ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1}.'),
                  SizedBox(
                      width: 200.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? "",
                          ),
                          Text(
                            product.barcode != null ? product.barcode!.join('\n') : '',
                            style: AppTextStyle.medium(
                                    color: const Color(0xff7C84A4))
                                .copyWith(fontSize: 15),
                          )
                        ],
                      )),
                  Text(
                   "0",
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  _withTextField
                      ? SizedBox(
                          width: 60.w,
                          height: 30.h,
                          child: TextField(
                            onTap: () {
                              textEditingController?.selection =
                                  const TextSelection(
                                      baseOffset: 0, extentOffset: 1);
                            },
                            controller: textEditingController,
                            style: const TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.w),
                              hintText: '0',
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Text(
                            AppFormatter.formatNumber(
                              num.parse(
                               "0",
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
