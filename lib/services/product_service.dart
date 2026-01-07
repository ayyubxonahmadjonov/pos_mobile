import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/services/api_service.dart';
import 'package:pos_mobile/services/headers.dart' show ApiHeaders;
import 'package:pos_mobile/services/http_result.dart';

final AppPrefs prefs = AppPrefs.instance;

final ApiHeaders _headers = ApiHeaders.instance;

class OrdersService {
  static Future<HttpResult> getAllProducts() async {
    const String path = '/api/v1/products_json_gzip';

    final data =
        await ApiService().post(path, headers: _headers.withTokenV2());

    if (!data.isSuccess) {
      return data;
    }

    try {
      final String downloadUrl = data.response['id'];
      final String fileName = downloadUrl.split('/').last;

      // 1. download
      final File downloadedFile =
          await downloadFile(downloadUrl, fileName);

      // 2. unzip
      final bytes = await downloadedFile.readAsBytes();
      final decodedBytes = GZipCodec().decode(bytes);
      final jsonContent = utf8.decode(decodedBytes);

      await downloadedFile.delete();

      // 3. return JSON
      return HttpResult(
        statusCode: 200,
        isSuccess: true,
        response: jsonContent,
      );
    } catch (e, s) {
      return HttpResult(
        statusCode: 500,
        isSuccess: false,
        response: 'GZIP parse error',
      );
    }
  }

  static Future<File> downloadFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    final request = await HttpClient().getUrl(Uri.parse(url));
    final response = await request.close();

    final sink = file.openWrite();
    await response.forEach(sink.add);
    await sink.close();

    return file;
  }
}
