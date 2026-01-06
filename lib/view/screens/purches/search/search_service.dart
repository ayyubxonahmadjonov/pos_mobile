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
import 'package:pos_mobile/models/service_list/service_list.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';
import '../../../../bloc/get_supplier/bloc.dart';
import '../../../../bloc/select_service/select_service_bloc.dart';
import '../../../../core/components/app_packages.dart';

class SearchSercide extends SearchDelegate {
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
        prefixStyle:
            AppTextStyle.medium().copyWith(color: Colors.white, fontSize: 16),
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
              itemCount: state.list2.length,
              itemBuilder: (context, index) {
                return Text(state.list2[index].name ?? '');
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<GetSupplierBloc, GetSupplierState>(
      builder: (context, state) {
        List<ServiceList> result = [];
        if (state is GetSupplierSuccesState) {
          result = state.list2.where((element) {
            return element.name!.toLowerCase().contains(query);
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
                          BlocProvider.of<SelectServiceBloc>(context).add(
                            GetServiceIdName(
                              supplierName: result[index].name??"",
                              supplierSId: result[index].serviceId??"",
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              result[index].name ?? "",
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
