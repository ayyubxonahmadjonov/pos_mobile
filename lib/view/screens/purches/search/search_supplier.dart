/*
    Created by: Bakhromjon Polat
    Created on: Dec 31 2022 08:56:03

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/core/theme/theme.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';
import '../../../../bloc/get_supplier/bloc.dart';
import '../../../../bloc/items/bloc.dart';
import '../../../../core/components/app_packages.dart';
import '../../../../models/supplier_list/supplier_list.dart';

class SearchSupplier extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme.getApplicationTheme().copyWith(
      hintColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        filled: false,
        prefixStyle: AppTextStyle.medium().copyWith(color: Colors.white,fontSize: 16 ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      AppIconButton(
        icon: Icons.clear,
        onPressed: () {
          if (query.isEmpty) {
            AppNavigator.pop();
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<GetSupplierBloc, GetSupplierState>(
      builder: (context, state) {
        if (state is GetSupplierSuccesState) {
          return ListView.builder(
              itemCount: state.list1.length,
              itemBuilder: (context, index) {
                return Text(state.list1[index].supplierName ?? '');
              });
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<GetSupplierBloc, GetSupplierState>(
      builder: (context, state) {
        List<SupplierList> result = [];
        if (state is GetSupplierSuccesState) {
          result = state.list1.where((element) {
            return element.supplierName!.toLowerCase().contains(query);
          }).toList();
        }
        return state is GetSupplierSuccesState
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<SupplierItemBloc>(context).add(
                            GetSupplierIdName(
                              result[index].supplierName!,
                              result[index].sId!,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              result[index].supplierName ?? "",
                              style: AppTextStyle.medium(),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
