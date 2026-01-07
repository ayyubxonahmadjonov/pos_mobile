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
import 'package:pos_mobile/core/constants/constants.dart';
import 'package:pos_mobile/core/theme/app_theme.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/components/product_list.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class ProductSearchDelegate extends SearchDelegate {
  final ProductScreenEnum screenEnum;
  final bool? editC;
  ProductSearchDelegate({ required this.screenEnum, this.editC=false });


  @override
  String? get searchFieldLabel => AppStrings.search;
  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: AppColors.white);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme.getApplicationTheme().copyWith(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.white.withValues(alpha: 0.6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.white.withValues(alpha: 0.6)),
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
    return ProductList(products: _products, screenEnum: screenEnum ,a: 3, editC: editC,
    onProductUpdated: () {
 close(context, null);
    },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Product>>(
      initialData: [].cast<Product>(),
      future: HiveItemsHelper.searchProducts(query),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {}

        _products = snapshot.requireData;

        return ProductList(products: _products, screenEnum: screenEnum, a: 3,editC: editC, 
        isSearchDelegate: true);
      },
    );
  }

  List<Product> _products = [];
}


/*
    Fixed version - resets query and list without closing delegate
*/
/*
    Fixed version - resets query and list without closing delegate
*/

  /*
    Created by: Bakhromjon Polat
    Created on: Dec 31 2022 08:56:03

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 
*/

