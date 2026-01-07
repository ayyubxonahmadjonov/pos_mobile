
import 'package:flutter/material.dart';
import '../../../../../../models/models.dart';
import 'item_list_tile.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final bool isLoadingMore;
  final bool isScanned;
  final bool isPurchase;
  final ProductScreenEnum screenEnum;
  final int? a;
  final bool? editC;
   final VoidCallback? onProductUpdated;
   final bool isSearchDelegate;

  const ProductList({
    super.key,
    required this.products,
    this.onProductUpdated,
    this.isLoadingMore = false,
    this.isScanned = false,
    this.isPurchase = false,
    this.isSearchDelegate = false,
    this.screenEnum = ProductScreenEnum.inventory,
    this.a = 1,
    this.editC = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == products.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final Product product = products[index];
        return ItemsListTile(
          isSearchDelegate: isSearchDelegate,
          onProductUpdated: onProductUpdated,
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
