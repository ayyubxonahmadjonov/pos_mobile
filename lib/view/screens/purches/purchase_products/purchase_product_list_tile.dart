/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 12:37:44
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:pos_mobile/models/models.dart';

// ignore: must_be_immutable
class PurchaseProductListTile extends StatelessWidget {
  final Product product;
  bool isScanned;
  PurchaseProductListTile({
    Key? key,
    required this.product,
    this.isScanned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name ?? ''),
      subtitle: Text(product.barcode != null ? product.barcode!.join(', ') : ''),
      trailing: const Text('10'),
      onTap: () {},
    );
  }
}
