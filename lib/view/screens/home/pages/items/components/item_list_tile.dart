import 'package:flutter/material.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/routes/app_navigator.dart';
import 'package:pos_mobile/view/screens/home/pages/items/product_details_screen.dart';

// ignore: must_be_immutable
class ItemsListTile extends StatelessWidget {
  bool isSearchDelegate;
  final VoidCallback? onProductUpdated;
  final Product product;
  final ProductScreenEnum screen;
  bool isScanned;
  bool isPurchase;
  final bool? editC;
  int? a;
  ItemsListTile({
    Key? key,
    this.editC = false,
    required this.a,
    required this.product,
    required this.screen,
    this.isScanned = false,
    this.isPurchase = false,
    this.onProductUpdated,
    this.isSearchDelegate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name ?? ''),
      subtitle: Text(product.barcode?.join(', ') ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(product.updateAmount?.toString() ?? '0'),
        ],
      ),
    onTap: () async {

        await AppNavigator.push(
          ProductDetilsScreen(product: product,isSearchDelegate: isSearchDelegate),
        );
      },
    );
  }
}

enum ProductScreenEnum { inventory, purchase, order }
