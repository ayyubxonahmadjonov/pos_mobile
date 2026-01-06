/*
    Created by: Ayubxon Ahmadjonov
    Updated date: 05/01/2026 16:40
*/

import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/models/required_data/company.dart';
import 'package:pos_mobile/models/required_data/profile.dart';
import 'package:pos_mobile/models/required_data/shops.dart';
import 'package:pos_mobile/models/required_data/user_shops.dart';
import 'package:pos_mobile/services/api_requests.dart';
import 'package:pos_mobile/services/headers.dart';
import 'package:pos_mobile/services/http_result.dart';

class RequiredData {
  static final ApiRequests _requests = ApiRequests.instance;
  static final ApiHeaders _headers = ApiHeaders.instance;

  /// ---------------- SELECT COMPANY ----------------
  static Future<String?> fetchCurrentCompany(
    String companyId,
    String tempToken,
  ) async {
    final HttpResult result = await _requests.post(
      '/auth/select_company',
      body: {
        'company_id': companyId,
        'temp_token': tempToken,
      },
      headers: {
           'timezone': '-300',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppPrefs.instance.token}',
      },
    );
    if (result.isSuccess) {
      
       return result.response['token'];
    }
    return null;
  }

  /// ---------------- CURRENT COMPANY ----------------
  static Future<Company?> fetchCurrentShop() async {

    final HttpResult result = await _requests.get(
      '/api/v1/current_company',
      headers: {
           'timezone': '-300',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppPrefs.instance.token}',
      },
    );
    print('Current company result: ${result.statusCode}, ${result.response}');

    if (result.isSuccess) {
      return Company.fromJson(result.response);
    }
    return null;
  }

  /// ---------------- ALL SHOPS ----------------
  static Future<Shops?> fetchShops() async {
    final HttpResult result = await _requests.get(
      '/api/v1/shop',
      headers: _headers.withTokenV2(),
    );

    if (result.isSuccess) {
      return Shops.fromJson(result.getData());
    }
    return null;
  }

  /// ---------------- USER SHOPS ----------------
  static Future<UserShops?> fetchUserShops() async {
    final HttpResult result = await _requests.get(
      '/api/v1/user/get_shops',
      headers: {
        'timezone': '-300',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppPrefs.instance.token}',
      },
    );
    if (result.isSuccess) {
      return UserShops.fromJson(result.response);
    }
    return null;
  }

  /// ---------------- PROFILE ----------------
  static Future<Profile?> fetchProfile() async {
    final HttpResult result = await _requests.get(
      '/api/v1/user/profile',
      headers: {
        'timezone': '-300',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppPrefs.instance.token}',
      },
    );

    if (result.isSuccess) {
      return Profile.fromJson(result.response);
    }
    return null;
  }
}
