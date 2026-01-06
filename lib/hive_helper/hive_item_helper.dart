
import 'dart:convert';

import 'package:converter_uz/converter_uz.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/product_model.dart';

class HiveItemsHelper {
  const HiveItemsHelper._();
  static final Box<ProductFromJson> box = HiveBoxes.productFromJsonBox;
  static final AppPrefs _prefs = AppPrefs.instance;

  static int _counted = 0;
  static int _uncounted = 0;

  static int get counted => _counted;
  static int get uncounted => _uncounted;

  static set setCounted(int count) => _counted = count;
  static set setUncounted(int count) => _uncounted = count;



  static Future<void> importProductsFromJson(String assetPath) async {
    print('json chaqirildi');
    try {
      String jsonString = await rootBundle.loadString(assetPath);
      List<dynamic> jsonList = json.decode(jsonString);

      print('Loaded JSON: ${jsonList.length} products');

      List<ProductFromJson> products = jsonList.map((e) => ProductFromJson.fromJson(e)).toList();

      print('Converted to Product objects: ${products.length} items');
      await HiveItemsHelper.putAllFromJson(products);

      print('All products saved to Hive successfully!');
    } catch (e, stackTrace) {
      print('❌ Error importing products: $e');
      print(stackTrace);
    }
  }
  static Future<void> putAllFromJson(List<ProductFromJson> products) async {
  try {
    Map<String, ProductFromJson> entries = {};

    for (var product in products) {
      // ID yoki key mavjudligini tekshirish
      if (product.id != null && product.id!.isNotEmpty) {
        final hiveKey = product.id!;
        entries[hiveKey] = product;
      }
    }

    // Hive ga saqlash
    if (entries.isNotEmpty) {
      // Hive box ProductFromJson bo'lishi kerak
      var boxJson = await Hive.openBox<ProductFromJson>('productsBoxJson');
      await boxJson.putAll(entries);
    }

    print('✅ All ProductFromJson saved to Hive successfully!');

  } catch (e, stackTrace) {
    print('❌ Error in putAllFromJson: $e');
    print(stackTrace);
  }
}

  static Future<void> putAll(List<ProductFromJson> products) async {
    try {
      Map<String, ProductFromJson> entries = {};

      for (var product in products) {
        // ID yoki key mavjudligini tekshirish
        if ((product.id != null && product.id!.isNotEmpty) ||
            (product.key.isNotEmpty)) {
          
          // Complex fieldlarni encode qilish
          // product.encodeComplexFields();
          
          // To'g'ri key ni aniqlash
          final hiveKey = product.key.isNotEmpty ? product.key : product.id!;
          entries[hiveKey] = product;
          
        } else {
        }
      }


      if (_prefs.lastUpdage != 0) {
        await putCountedProducts();
        entries.addAll(_countedProducts);
      }

      // Hive ga saqlash
      if (entries.isNotEmpty) {
        await box.putAll(entries);
        await _prefs.setLastUpdate();
      } else {
      }

      _countedProducts.clear();
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  /// Bitta mahsulotni yangilash
  static Future<void> updateProduct(ProductFromJson product) async {
    try {
      final key = product.key.isNotEmpty ? product.key : product.id!;
      
      // Encode qilish
      // product.encodeComplexFields();
      
      // Saqlash
      await box.put(key, product);
      
    } catch (e) {
      rethrow;
    }
  }

  /// Product ni key bo'yicha olish
  static ProductFromJson? getByKey(String key) {
    try {
      return box.get(key);
    } catch (e) {
      return null;
    }
  }

  /// Product ni ID bo'yicha olish
  static ProductFromJson? getById(String id) {
    try {
      for (var product in box.values) {
        if (product.id == id) {
          return product;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Barcode bo'yicha qidirish
  static ProductFromJson? getByBarcode(String? barcode) {
    if (barcode == null || barcode.isEmpty) return null;
    
    try {
      for (var item in box.values) {
        if (item.barcodes != null && item.barcodes!.contains(barcode)) {
          return item;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Mahsulotlarni qidirish
  static Future<List<ProductFromJson>> searchProducts(String query) async {
    try {
      query = query.trim().toLowerCase().toLatin();
      
      return box.values.where((product) {
        String name = product.name.toString().toLowerCase().toLatin();
        String sku = product.sku.toString().toLowerCase();

        return (name.contains(query) ||
            sku.contains(query) ||
            (product.barcodes != null && 
             product.barcodes!.join(' ').toLowerCase().contains(query)));
      }).toList();
    } catch (e) {
      // print('❌ Error searching products: $e');
      return [];
    }
  }

  static final Map<String, ProductFromJson> _countedProducts = {};

  /// Sanalgan mahsulotlarni saqlash
  static Future<void> putCountedProducts() async {
    try {
      _countedProducts.clear();
      Map<String, ProductFromJson> entries = {};
      
      for (var product in box.values) {
        if (product.amount != null && product.amount! > 0) {
          final key = product.key.isNotEmpty ? product.key : product.id!;
          entries[key] = product;
        }
      }
      
      _countedProducts.addAll(entries);
    } catch (e) {
    }
  }

  /// Barcha skanerlangan mahsulotlarni tozalash
  static Future<void> clearScannedProducts() async {
    try {
      Map<String, ProductFromJson> entries = {};
      int i = 0;
      
      for (var product in box.values) {
        final key = product.key.isNotEmpty ? product.key : product.id!;
        
        // product.setIsScanned = false;
        // product.setRealStock = 0;
        
        entries[key] = product;
        i++;
        
        // Har 3000 ta mahsulotda delay berish
        if (i % 3000 == 0) {
          await Future.delayed(const Duration(milliseconds: 20));
        }
      }
      
      await box.putAll(entries);
      entries.clear();
      
    } catch (e) {
    }
  }

  /// Barcha mahsulotlarni o'chirish
  static Future<void> clearAll() async {
    try {
      await box.clear();
      _countedProducts.clear();
    } catch (e) {
    }
  }

  /// Statistika
  static Map<String, dynamic> getStatistics() {
    return {
      'total': box.length,
      'counted': _counted,
      'uncounted': _uncounted,
      'scanned': box.values.where((p) => p.amount != null && p.amount! > 0).length,
    };
  }
}