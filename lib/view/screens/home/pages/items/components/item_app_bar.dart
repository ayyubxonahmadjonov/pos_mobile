/* 
    Created by Bahromjon Po'lat
    Created at 31.08.2022 11:30
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_item_helper.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/barcode/select_scan_type.dart';
import 'product_search_delegate.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class ItemsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  const ItemsAppBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      shadowColor: AppColors.black,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 95.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 36.h,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    margin: EdgeInsets.only(left: 16.w),
                    decoration: AppShapes.circular(
                      color: AppColors.filledSearchColor.withOpacity(.12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.search,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.searchItemName,
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
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(
                        screenEnum: ProductScreenEnum.inventory,
                      ),
                    );
                  }),
                ),
                AppIconButton(
                  icon: CupertinoIcons.barcode_viewfinder,
                  onPressed: () {
                    AppNavigator.push(
                      const SelectBarCodeTypePage(from: 'inventory'),
                    );
                    // AppNavigator.pushNamed(
                    //   RouteNames.barcodeScan,
                    //   args: 'inventory',
                    // );
                  },
                )
              ],
            ),
            BlocBuilder<ItemsTabBarBloc, ItemsTabBarState>(
              builder: (context, state) {
                return TabBar(
                  isScrollable: true,
                  controller: controller,
                  tabs: List.generate(
                    3,
                    (index) => Tab(child: CustomTab(index: index)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}

class CustomTab extends StatelessWidget {
  final int index;
  const CustomTab({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: getLabel(index), children: [
        WidgetSpan(
          child: Container(
            height: 19.h,
            margin: EdgeInsets.only(left: 7.w),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: AppShapes.circular(
              radius: 10.0,
              color: AppColors.white.withOpacity(.2),
            ),
            child: Text(
              getCount(index).toString(),
              style: AppTextStyle.medium(size: 12.0, color: AppColors.white),
            ),
          ),
        )
      ]),
    );
  }

  String getLabel(int index) {
    switch (index) {
      case 0:
        return AppStrings.all;
      case 1:
        return AppStrings.scanned;
      case 2:
        return AppStrings.notScanned;
      default:
        return 'No stock';
    }
  }

  int getCount(int index) {
    switch (index) {
      case 0:
        return HiveItemsHelper.counted + HiveItemsHelper.uncounted;
      case 1:
        return HiveItemsHelper.counted;
      case 2:
        return HiveItemsHelper.uncounted;
      default:
        return 0;
    }
  }
}
