// /* 
//     Created by Bahromjon Po'lat
//     Created at 30.08.2022 18:52
// */

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pos_mobile/bloc/blocs.dart';
// import 'package:pos_mobile/core/constants/pref_keys.dart';
// import 'package:pos_mobile/core/core.dart';
// import 'package:pos_mobile/hive_helper/hive_helper.dart';
// import 'package:pos_mobile/models/models.dart';
// import 'package:pos_mobile/routes/routes.dart';
// import 'package:pos_mobile/view/widgets/widgets.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   final Employee? employee = EmployeeHelper.currentEmployee;

//   late AppDialog appDialog;

//   @override
//   void initState() {
//     super.initState();
//     appDialog = AppDialog(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AppPrefs prefs = AppPrefs.instance;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppStrings.settings),
//         actions: [
//           AppIconButton(
//             icon: Icons.logout_outlined,
//             onPressed: () {
//               appDialog.showSimpleDialog(
//                 title: AppStrings.logout,
//                 contentText: AppStrings.wantToExit,
//                 onYesPressed: () async {
//                   await HiveBoxes.clearBoxes();
//                   AppNavigator.pushNamedAndRemoveUntil(RouteNames.login);
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             trailing: _trailing(),
//             shape: AppShapes.simple(),
//             tileColor: AppColors.grey,
//             title: Text(
//               "${prefs.getString(PrefKeys.userFirstName)} ${prefs.getString(PrefKeys.userLastName)}",
//               style: AppTextStyle.regular(size: 22),
//             ),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: 11.h,
//             ),
//             leading: Container(
//               height: 50.h,
//               width: 50.w,
//               decoration: AppShapes.circular(
//                 radius: 25.r,
//                 color: AppColors.lightColor,
//               ),
//               child: Icon(Icons.person, size: 32.r),
//             ),
//           ),
//           SizedBox(height: 28.h),
//           PrimaryButton(
//             label: AppStrings.updatingProducts,
//             isLoading: context.watch<GetItemsBloc>().state
//                 is GetAllProductsProccesState,
//             onPressed: () {
//               appDialog.showSimpleDialog(
//                   title: AppStrings.updatingProducts,
//                   contentText: AppStrings.wantToUpdate,
//                   onYesPressed: () {
//                     BlocProvider.of<GetItemsBloc>(context)
//                         .add(GetAllProductsEvent());
//                     AppNavigator.pop();
//                   });
//               setState(() {});
//             },
//           ),
//           SizedBox(height: 10.h),
//           _getLastUpdateTime(),
//           SizedBox(height: 28.h),
//           ElevatedButton(
//               child: const Text(AppStrings.clearProducts,
//                   style: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 appDialog.showSimpleDialog(
//                     title: AppStrings.clearProducts,
//                     contentText: AppStrings.wantToClear,
//                     onYesPressed: () async {
//                       // await Future.delayed(const Duration(milliseconds: 200));
//                       HiveItemsHelper.clearScannedProducts();
//                       HiveBoxes.productsBox.clear();
//                       setState(() {});
//                       AppNavigator.pop();

//                       Fluttertoast.showToast(
//                         msg: AppStrings.countedProductsWereCleared,
//                       );
//                     });
//               }),
//         ],
//       ).symmetricPadding(h: 16, v: 28),
//     );
//   }

//   Text _getLastUpdateTime() {
//     int lastUpdate = AppPrefs.instance.lastUpdage;
//     if (lastUpdate == 0) {
//       return const Text('');
//     }
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
//     String formatted = AppFormatter.formatDate(date);

//     return Text.rich(
//       TextSpan(text: '${AppStrings.lastUpdate}: ', children: [
//         TextSpan(text: formatted, style: AppTextStyle.semiBold()),
//       ]),
//       style: AppTextStyle.regular(size: 14),
//     );
//   }

//   Icon _trailing() => const Icon(
//         AppIcons.arrowRight,
//         color: AppColors.black,
//       );
// }

/*
    Created by Bahromjon Po'lat
    Created at 30.08.2022 18:52
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/constants/pref_keys.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/routes/routes.dart';
import 'package:pos_mobile/view/widgets/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Employee? employee = EmployeeHelper.currentEmployee;
  late AppDialog appDialog;

  @override
  void initState() {
    super.initState();
    appDialog = AppDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final AppPrefs prefs = AppPrefs.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        actions: [
          AppIconButton(
            icon: Icons.logout_outlined,
            onPressed: () {
              appDialog.showSimpleDialog(
                title: AppStrings.logout,
                contentText: AppStrings.wantToExit,
                onYesPressed: () async {
                  await HiveBoxes.clearBoxes();
                  AppNavigator.pushNamedAndRemoveUntil(RouteNames.login);
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            trailing: _trailing(),
            shape: AppShapes.simple(),
            tileColor: AppColors.grey,
            title: Text(
              "${prefs.getString(PrefKeys.userFirstName)} ${prefs.getString(PrefKeys.userLastName)}",
              style: AppTextStyle.regular(size: 22),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 11.h,
            ),
            leading: Container(
              height: 50.h,
              width: 50.w,
              decoration: AppShapes.circular(
                radius: 25.r,
                color: AppColors.lightColor,
              ),
              child: Icon(Icons.person, size: 32.r),
            ),
          ),
          SizedBox(height: 28.h),
          PrimaryButton(
            label: AppStrings.updatingProducts,
            isLoading: context.watch<GetItemsBloc>().state
                is GetAllProductsProccesState,
            onPressed: () {
              appDialog.showSimpleDialog(
                  title: AppStrings.updatingProducts,
                  contentText: AppStrings.wantToUpdate,
                  onYesPressed: () {
                    BlocProvider.of<GetItemsBloc>(context)
                        .add(GetAllProductsEvent(
                      page: 0,
                      limit: 0, 
                    ));
                    AppNavigator.pop();
                  });
              setState(() {});
            },
          ),
          SizedBox(height: 10.h),
          _getLastUpdateTime(),
          SizedBox(height: 28.h),
          ElevatedButton(
              child: const Text(AppStrings.clearProducts,
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                appDialog.showSimpleDialog(
                    title: AppStrings.clearProducts,
                    contentText: AppStrings.wantToClear,
                    onYesPressed: () async {
                      
                      HiveItemsHelper.clearScannedProducts();
                      HiveBoxes.productsBox.clear();
                      setState(() {});
                      AppNavigator.pop();
                      Fluttertoast.showToast(
                        msg: AppStrings.countedProductsWereCleared,
                      );
                    });
              }),
        ],
      ).symmetricPadding(h: 16, v: 28),
    );
  }

  Text _getLastUpdateTime() {
    int lastUpdate = AppPrefs.instance.lastUpdage;
    if (lastUpdate == 0) {
      return const Text('');
    }
    DateTime date = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
    String formatted = AppFormatter.formatDate(date);
    return Text.rich(
      TextSpan(text: '${AppStrings.lastUpdate}: ', children: [
        TextSpan(text: formatted, style: AppTextStyle.semiBold()),
      ]),
      style: AppTextStyle.regular(size: 14),
    );
  }

  Icon _trailing() => const Icon(
        AppIcons.arrowRight,
        color: AppColors.black,
      );
}