///   Created by: Bahromjon Po'at.
///   Created date: 8/24/22 6:17 PM

import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/bloc/get_supplier/bloc.dart';
import 'package:pos_mobile/core/components/app_packages.dart';
import 'package:pos_mobile/core/theme/app_theme.dart';
import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/routes/routes.dart';

import 'bloc/add_purches/bloc.dart';
import 'bloc/creat_purches/bloc.dart';
import 'bloc/edit_purches/bloc.dart';
import 'bloc/items/bloc.dart';
import 'bloc/select_service/select_service_bloc.dart';
import 'bloc/update_purchase_order/bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppPrefs prefs = AppPrefs.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);

  // if (state == AppLifecycleState.inactive) {
  //   if (!prefs.token.isNotEmpty) return;
  //   AppTimer.setTime();
  // }

  // if (state == AppLifecycleState.resumed) {
  //   if (!AppTimer.isExpired()) return;
  //   AppNavigator.pushNamedAndRemoveUntil(RouteNames.pincode);
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812),
      builder: (context, w) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BottomNavigationBarBloc()),
          BlocProvider(create: (_) => ItemsTabBarBloc()),
          BlocProvider(create: (_) => AuthBloc()),
          // BlocProvider(create: (_) => BarcodeBloc()),
          BlocProvider(create: (_) => GetItemsBloc()),
          // BlocProvider(create: (_) => PurchaseBloc()),
          BlocProvider(create: (_) => GetSupplierBloc()),
          BlocProvider(create: (_) => PurchaseproductListBloc()),
          BlocProvider(create: (_) => CreatPurchesOrderBloc()),
          BlocProvider(create: (_) => OrderBloc()),
          BlocProvider(create: (_) => SupplierItemBloc()),
          BlocProvider(create: (_) => EditPurchaseproductListBloc()),
          BlocProvider(create: (_) => UpdatePurchaseOrderBloc()),
          // BlocProvider(create: (_) => GetOnlineProductBloc()),
          BlocProvider(create: (_) => SelectServiceBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AppNavigator.navigatorKey,
          title: 'POS',
          theme: AppTheme.getApplicationTheme(),
          initialRoute: _getintialRoute(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }

  String _getintialRoute() {
    if (prefs.employeeService != null) {
      return RouteNames.pincode;
    }
    if (prefs.token.isEmpty) {
      return RouteNames.login;
    }
    return RouteNames.home;
  }
}

class AppTimer {
  static const int _seconds = 15000;
  static int _lastTime = DateTime.now().millisecondsSinceEpoch;
  static setTime() => _lastTime = DateTime.now().millisecondsSinceEpoch;
  static get lastTime => _lastTime;

  static bool isExpired() =>
      _lastTime + _seconds < DateTime.now().millisecondsSinceEpoch;
}
