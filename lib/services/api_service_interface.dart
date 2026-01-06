/*
    Created by: Bakhromjon Polat
    Created on: Dec 28 2022 14:11:55

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:pos_mobile/services/http_result.dart';
import 'package:http/http.dart' as http;

abstract class ApiServiceInterface {
  final String baseUrl = 'https://dev.api.7i.uz';
  Future<HttpResult> get(String path, {Map<String, String> headers});

  Future<HttpResult> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
  });

  HttpResult getResult(http.Response response);
}

enum HeadersEnum {
  general,
  withToken,
  withTokenV2,
  withAcceptServiceAndToken,
  withAcceptService,
  forItems,
  forOrder,
}
