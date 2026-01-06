/*

  Created by: Bakhromjon Polat
  Created on: Feb 24 2023 15:03:26
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_mobile/view/widgets/app/products_data_header.dart';

class PurchasePersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const ProductDataHeader(lastString: "получен");
  }
  @override
  double get maxExtent => 56.h;
  @override
  double get minExtent => 56.h;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
