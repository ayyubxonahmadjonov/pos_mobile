// /*
//     Created by: Bakhromjon Polat
//     Created on: Dec 29 2022 14:17:28

//     Github: https://github.com/BahromjonPolat
//     Leetcode: https://leetcode.com/BahromjonPolat/
//     LinkedIn: https://linkedin.com/in/bahromjon-polat
//     Telegram: https://t.me/BahromjonPolat

//     Documentation: 

// */

// import 'package:flutter/material.dart';
// import 'package:pos_mobile/models/products.dart';


// import '../../../../../../models/models.dart';
// import 'item_list_tile.dart';

// // ignore: must_be_immutable
// class ProductList extends StatelessWidget {
//   final List<Product> products;
//   bool isScanned;
//   bool isPurchase;
//   final _scrollController = ScrollController();
//   ProductScreenEnum screenEnum;
//   final int? a;
//   final bool?editC;
//   ProductList({
//     super.key,
//     required this.products,
//     this.isScanned = false,
//     this.isPurchase = false,
//     this.editC=false,
//     this.screenEnum = ProductScreenEnum.inventory,
//     this.a=1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: _scrollController,
//       itemCount: products.length,
//       itemBuilder: ((context, index) {
//         Product product = products[index];
//         return ItemsListTile(
//           editC: editC,
//           screen: screenEnum,
//           product: product,
//           isScanned: isScanned,
//           isPurchase: isPurchase,
//           a: a,
//         );
//       }),
//     );
//   }
// }
/*
    Created by: Bakhromjon Polat
    Created on: Dec 29 2022 14:17:28
    Updated: ScrollController va Load More indicator qo'shildi — January 2026
*/
import 'package:flutter/material.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/product_model.dart';
import '../../../../../../models/models.dart';
import 'item_list_tile.dart';

class ProductList extends StatelessWidget {
  final List<ProductFromJson> products;
  final ScrollController? scrollController;
  final bool isLoadingMore;
  final bool isScanned;
  final bool isPurchase;
  final ProductScreenEnum screenEnum;
  final int? a;
  final bool? editC;

  const ProductList({
    super.key,
    required this.products,
    this.scrollController,
    this.isLoadingMore = false,
    this.isScanned = false,
    this.isPurchase = false,
    this.screenEnum = ProductScreenEnum.inventory,
    this.a = 1,
    this.editC = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: products.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // Oxirgi element — loading indicator
        if (index == products.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final ProductFromJson product = products[index];
        return ItemsListTile(
          editC: editC,
          screen: screenEnum,
          product: product,
          isScanned: isScanned,
          isPurchase: isPurchase,
          a: a,
        );
      },
    );
  }
}