/*
    Created by: Bakhromjon Polat
    Created on: Dec 28 2022 14:47:58

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_mobile/services/api_service_interface.dart';
import 'package:pos_mobile/services/http_result.dart';

class ApiService implements ApiServiceInterface {
  @override
  Future<HttpResult> get(String path, {Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse('$baseUrl$path');
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      return getResult(response);
    } catch (err) {
      return HttpResult(statusCode: 1200, response: err);
    }
  }

@override
Future<HttpResult> post(
  String path, {
  Object? body,
  Map<String, String>? headers,
}) async {
  try {
    Uri url = Uri.parse('$baseUrl$path');

    http.Response response;

    if (body == null) {
      response = await http.post(
        url,
        headers: headers,
      );
    } else {
      response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    }

    return getResult(response);
  } catch (err) {
    return HttpResult(statusCode: 1200, response: err);
  }
}

@override
Future<HttpResult> put(
  String path, {
  Object? body,
  Map<String, String>? headers,
}) async {
  try {
    Uri url = Uri.parse('$baseUrl$path');
    http.Response response;

    if (body == null) {
      response = await http.put(
        url,
        headers: headers,
      );
    } else {
      response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    }

    return getResult(response);
  } catch (err) {
    return HttpResult(statusCode: 1200, response: err);
  }
}


  @override
  HttpResult getResult(http.Response response) {
    dynamic decodedData = jsonDecode(response.body);
    HttpResult result = HttpResult(
      isSuccess: response.statusCode == 200 || response.statusCode == 201,
      statusCode: response.statusCode,
      response: decodedData,
    );

    return result;
  }

 @override
  String get baseUrl => 'https://api.7i.uz';
   String get baseUrl2 => 'https://api.7i.uz';

  // @override
  // String get baseUrl => 'https://pos.in1.uz/api';
  //  String get baseUrl2 => 'https://dev.in1.uz/api';
}
