import 'package:flutter/material.dart';
import 'package:pos_mobile/models/product/scanned_product.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/product_model.dart';
import '../../../../../../models/models.dart';
import 'item_list_tile.dart';

class ProductListScanned extends StatelessWidget {
  final List<ScannedProduct> scannedproducts;

  final bool isLoadingMore;
  final bool isScanned;
  final bool isPurchase;
  final ProductScreenEnum screenEnum;
  final bool isSearchDelegate;
  final int? a;
  final bool? editC;

  const ProductListScanned({
    super.key,

    required this.scannedproducts,
     this.isSearchDelegate = false,
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
      padding: const EdgeInsets.all(8),
      itemCount: scannedproducts.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == scannedproducts.length) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final ScannedProduct scannedproduct = scannedproducts[index];
        Product productScanned = Product(
          name: scannedproduct.name,
          amount: scannedproduct.amount,
          barcode: scannedproduct.barcode,
          sku: scannedproduct.sku,
          id: scannedproduct.id,
          cost: scannedproduct.cost,
          companyId: scannedproduct.companyId,
          shopPrices: scannedproduct.shopPrices,
          measurementValues: scannedproduct.measurementValues,
          originalAmount: scannedproduct.originalAmount,
          updateAmount: scannedproduct.updateAmount,
          isScannedProduct: true,
        );
        return ItemsListTile(
isSearchDelegate:isSearchDelegate ,
          editC: editC,
          screen: screenEnum,
          product: productScanned,
          isScanned: isScanned,
          isPurchase: isPurchase,
          a: a,
        );
      },
    );
  }
}
