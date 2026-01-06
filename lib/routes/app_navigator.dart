/*
    Created by: Bahromjon Po'lat.
    Created date: 26/08/2022 11:51
*/

import 'package:flutter/material.dart';

class AppNavigator {
  const AppNavigator._();
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? args,
  }) {
    return _navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  static Future<dynamic> push(Widget page) => _navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static Future<dynamic> pushReplacement(Widget page) =>
      _navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  static void pop([Object? result]) => _navigatorKey.currentState?.pop(result);

  static void checkAndPop() {
    if (_navigatorKey.currentState!.canPop()) {
      pop();
    }
  }

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
