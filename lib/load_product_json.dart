import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> loadProductJson() async {
  try {
    String jsonString = await rootBundle.loadString('assets/product_list.json');
    
    List<dynamic> jsonList = json.decode(jsonString);

    print('JSON loaded successfully! Items: ${jsonList.length}');
    return jsonList;
  } catch (e) {
    print('Error loading JSON: $e');
    return [];
  }
}
