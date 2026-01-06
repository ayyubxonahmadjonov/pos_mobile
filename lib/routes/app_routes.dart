import 'package:flutter/material.dart';
import 'package:pos_mobile/bloc/blocs.dart';
import 'package:pos_mobile/core/core.dart';
import 'package:pos_mobile/view/screens/screen.dart';
import 'routes.dart';

class AppRoutes {
  const AppRoutes._();
  static Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    String? name = settings.name;

    switch (name) {
      case RouteNames.login:
        return _route(const LoginScreen());

      case RouteNames.home:
        return _route(const HomeScreen());

      // case RouteNames.verifyOtp:
      //   return _route(const VerifyOtpScreen());


      case RouteNames.selectingDevice:
        return _route(const SelectingPosDeviceScreen());

      case RouteNames.pincode:
        return _route(const PincodeScreen());

      case RouteNames.barcodeScan:
        return _route(BarcodeScanPage(from: args.toString()));

      case RouteNames.general:
        return _route(const GeneralScreen());

      case RouteNames.editingProfile:
        return _route(const EditingProfileScreen());

      case RouteNames.wareHouse:
        return _route(BlocProvider(
          create: (context) => PurchaseBloc(),
          child: const PurchaseScreen(),
        ));

      case RouteNames.inventory:
        return _route(const InventoryScreen());

      case RouteNames.purchaseDetails:
        return _route(const PurchaseDetailsScreen());

      case RouteNames.purchaseProducts:
        return _route(PurchaseProductListScreen(
          editC: args as bool,
        ));

      case RouteNames.newOrder:
        return _route(BlocProvider(
          create: (context) => CreateOrderBloc(),
          child: CreateOrderScreen(),
        ));

      case RouteNames.updateOrder:
        return _route(const UpdateOrderPage());

      case RouteNames.purchaseCreat:
        return _route(const CreateNewPurchase());

      case RouteNames.orders:
        return _route(BlocProvider(
          create: (context) => GetOrderBloc(),
          child: const OrdersScreen(),
        ));

      case RouteNames.orderItems:
        return _route(const OrderItemsList());

      default:
        return null;
    }
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
