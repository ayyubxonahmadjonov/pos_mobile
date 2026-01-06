/*

  Created by: Azizbek
  Created on: Feb 22 2023 12:54:17
  Github: https://github.com/CoderAltair
  Telegram: https://t.me/@azizbek_kv

  Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/core/core.dart';

import '../creat_purches/search_purchase_order.dart';

class PurchesItemsAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final TabController controller;
  const PurchesItemsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: AppColors.black,
      title: Text(
        AppStrings.purchesAppBarT,
        style: AppTextStyle.medium().copyWith(
          color: Colors.white,
        ),
      ),
      actions: const [
        Icon(
          AppIcons.settings,
          size: 25,
        ),
        SizedBox(
          width: 20,
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Expanded(
            child: Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.w),
          decoration: AppShapes.circular(color: Colors.white.withOpacity(0.5)),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.search,
                color: AppColors.white,
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.searchItemName2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.regular(
                  size: 13,
                  color: AppColors.white,
                ),
              ).wrapExpanded(),
            ],
          ),
        ).onClick(() {
          showSearch(context: context, delegate: PurchaseSerachDelegate());
        })),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 110.h);
}
