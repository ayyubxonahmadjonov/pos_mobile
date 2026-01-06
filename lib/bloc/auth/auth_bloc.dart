/*
    Created by: Ayubxon Ahmadjonov
    Created date: 05/01/2026 16:20
*/

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pos_mobile/core/constants/pref_keys.dart';
import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/models/company_model.dart';
import 'package:pos_mobile/models/required_data/company.dart';
import 'package:pos_mobile/models/required_data/profile.dart';
import 'package:pos_mobile/models/required_data/user_shops.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/http_result.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/services/required_data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRequests requests = ApiRequests.instance;
  final AppPrefs prefs = AppPrefs.instance;

  late String _phone;
  String get phone => _phone;

  UserShops? userShops;
  LoginResponseModel? userCompany;

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_login);
    on<SelectCompanyEvent>(_selectCompany);
    on<SelectShopEvent>(selectShop);
  }

  /// ---------------- LOGIN ----------------
  FutureOr<void> _login(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    _phone = event.phone;
    emit(AuthLoginLoadingState());

    final HttpResult result = await requests.login(
      phone: event.phone,
      password: event.password,
    );

    if (result.isSuccess) {
      final fetchData = LoginResponseModel.fromJson(result.response);
      prefs.setString('temp_token', fetchData.tempToken);
      emit(AuthLoginSuccessState(loginResponseModel: fetchData));
    } else {
      emit(AuthLoginFailedState(result.getData()));
    }
  }

  /// ---------------- SELECT COMPANY ----------------
  Future<void> _selectCompany(
    SelectCompanyEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SelectCompanyLoadingState());
    String tempToken = prefs.getString('temp_token');

    try {
      final token =
          await RequiredData.fetchCurrentCompany(event.companyId, tempToken);

      if (token == null) {
        emit(SelectCompanyFailedState('Unable to select company'));
        return;
      }
      await prefs.setString('token', token);
      userShops = await RequiredData.fetchUserShops();
      if (userShops == null ||
          userShops!.data == null ||
          userShops!.data!.isEmpty) {
        emit(SelectShopFailedState('No shops found'));
        return;
      }

      emit(SelectCompanySuccessState());
    } catch (e, s) {
      debugPrint('SelectCompany error: $e\n$s');
      emit(SelectCompanyFailedState('Something went wrong'));
    }
  }

  // ---------------- SELECT SHOP ----------------
  Future<void> selectShop(SelectShopEvent event, Emitter<AuthState> emit) async {
    emit(SelectShopLoadingState());
    if (event.selectedShop != null) {
  
      Company? company = await RequiredData.fetchCurrentShop();
      Profile? profile = await RequiredData.fetchProfile();

      if (company != null && profile != null) {
        prefs.setString(PrefKeys.companyId, company.id ?? '');
        prefs.setString(PrefKeys.companyName, company.name ?? '');
        prefs.setBool(PrefKeys.autoGenerate, company.autoGenerate ?? false);
        prefs.setString(PrefKeys.shopId, event.selectedShop?.id ?? '');
        prefs.setString(PrefKeys.shopName, event.selectedShop!.title ?? '');
        prefs.setString(PrefKeys.userId, profile.userId ?? '');
        prefs.setString(PrefKeys.userFirstName, profile.firstName ?? '');
        prefs.setString(PrefKeys.userLastName, profile.lastName ?? '');
        prefs.setString(PrefKeys.userPasscode, profile.passcode ?? '');
        emit(SelectShopSuccessState());
      } else {
        emit(SelectShopFailedState('Unable to select shop.'));
      }
    } else {
      emit(SelectShopFailedState('Unable to select shop.'));
    }
  }

  /// ---------------- COMMON SHOP SETUP ----------------
  Future<void> _autoSelectShop(
    UserShops shop,
    Emitter<AuthState> emit,
  ) async {
    final company = await RequiredData.fetchCurrentShop();
    final profile = await RequiredData.fetchProfile();

    if (company != null && profile != null) {
      await prefs.setString('company_json', company.toJson().toString());
      await prefs.setString('profile_json', profile.toJson().toString());
      await prefs.setString('shop_json', shop.toJson().toString());

      emit(SelectShopSuccessState());
    } else {
      emit(SelectShopFailedState('Unable to load shop data'));
    }
  }
}
