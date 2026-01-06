/* 
    Created by Bahromjon Po'lat
    Created at 30.08.2022 18:52
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/screens/home/pages/main/components/app_drawer.dart';
import 'package:pos_mobile/view/screens/home/pages/main/components/category_button.dart';
import 'package:pos_mobile/view/screens/home/pages/main/components/home_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const HomeAppBar(),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 6.h,
        crossAxisSpacing: 6.w,
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
        children: [
          // Отчеты
          CategoryButton(
            assetIcon: AppIcons.health,
            label: AppStrings.reports,
            onPressed: () {
              Fluttertoast.showToast(msg: 'Скоро');
              // AppNavigator.pushNamed(RouteNames.barcodeScan);
            },
          ),

          // Товары
          CategoryButton(
            assetIcon: AppIcons.bag,
            label: AppStrings.products,
            onPressed: () {
              Fluttertoast.showToast(msg: 'Скоро');
              // AppNavigation.pushNamed(AppRouteName.PRODUCT_MAIN);
            },
          ),

          // Склад
          CategoryButton(
            assetIcon: AppIcons.shopRemove,
            label: AppStrings.storehouse,
            onPressed: () {
              AppNavigator.pushNamed(RouteNames.wareHouse);
            },
          ),

          // Заказы
          CategoryButton(
            assetIcon: AppIcons.taskSquare,
            label: AppStrings.orders,
            onPressed: () {
              // Fluttertoast.showToast(msg: 'Скоро');
              AppNavigator.pushNamed(RouteNames.orders);
            },
          ),

          // Финансы
          CategoryButton(
            assetIcon: AppIcons.emptyWalletTicket,
            label: AppStrings.finance,
            onPressed: () async {
              Fluttertoast.showToast(msg: 'Скоро');
            },
          ),

          // Сотрудники
          CategoryButton(
            assetIcon: AppIcons.group,
            label: AppStrings.employees,
            onPressed: () {
              Fluttertoast.showToast(msg: 'Скоро');
            },
          ),
        ],
      ),
    );
  }
}
