import 'dart:convert';

import 'package:converter_uz/converter_uz.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/product_model.dart';

class HiveItemsHelper {
  const HiveItemsHelper._();
  static final Box<Product> box = HiveBoxes.productsBox;
  static final AppPrefs _prefs = AppPrefs.instance;

  static int _counted = 0;
  static int _uncounted = 0;

  static int get counted => _counted;
  static int get uncounted => _uncounted;

  static set setCounted(int count) => _counted = count;
  static set setUncounted(int count) => _uncounted = count;

  static Future<void> putAll(List<Product> products) async {
    try {
      Map<String, Product> entries = {};

      for (var product in products) {
        if ((product.id != null && product.id!.isNotEmpty) ||
            (product.key.isNotEmpty)) {
          final hiveKey = product.key.isNotEmpty ? product.key : product.id!;
          entries[hiveKey] = product;
        } else {}
      }

      if (_prefs.lastUpdage != 0) {
        await putCountedProducts();
        entries.addAll(_countedProducts);
      }

      // Hive ga saqlash
      if (entries.isNotEmpty) {
        await box.putAll(entries);
        await _prefs.setLastUpdate();
      } else {}

      _countedProducts.clear();
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  /// Bitta mahsulotni yangilash
  static Future<void> updateProduct(Product product) async {
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
  static Product? getByKey(String key) {
    try {
      return box.get(key);
    } catch (e) {
      return null;
    }
  }

  /// Product ni ID bo'yicha olish
  static Product? getById(String id) {
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

  static Product? getByBarcode(String? barcode) {
    if (barcode == null || barcode.isEmpty) return null;

    try {
      for (var item in box.values) {
        if (item.barcode != null && item.barcode!.contains(barcode)) {
          return item;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Mahsulotlarni qidirish
  static Future<List<Product>> searchProducts(String query) async {
    try {
      query = query.trim().toLowerCase().toLatin();

      return box.values.where((product) {
        String name = product.name.toString().toLowerCase().toLatin();
        String sku = product.sku.toString().toLowerCase();

        return (name.contains(query) ||
            sku.contains(query) ||
            (product.barcode != null &&
                product.barcode!.join(' ').toLowerCase().contains(query)));
      }).toList();
    } catch (e) {
      // print('❌ Error searching products: $e');
      return [];
    }
  }

  static final Map<String, Product> _countedProducts = {};

  /// Sanalgan mahsulotlarni saqlash
  static Future<void> putCountedProducts() async {
    try {
      _countedProducts.clear();
      Map<String, Product> entries = {};

      for (var product in box.values) {
        if (product.amount != null && product.amount! > 0) {
          final key = product.key.isNotEmpty ? product.key : product.id!;
          entries[key] = product;
        }
      }

      _countedProducts.addAll(entries);
    } catch (e) {}
  }

  static Future<void> clearScannedProducts() async {
    try {
      Map<String, Product> entries = {};
      int i = 0;

      for (var product in box.values) {
        final key = product.key.isNotEmpty ? product.key : product.id!;

        entries[key] = product;
        i++;

        if (i % 3000 == 0) {
          await Future.delayed(const Duration(milliseconds: 20));
        }
      }

      await box.putAll(entries);
      entries.clear();
    } catch (e) {}
  }

  static Future<void> clearAll() async {
    try {
      await box.clear();
      _countedProducts.clear();
    } catch (e) {}
  }

  /// Statistika
  static Map<String, dynamic> getStatistics() {
    return {
      'total': box.length,
      'counted': _counted,
      'uncounted': _uncounted,
      'scanned':
          box.values.where((p) => p.amount != null && p.amount! > 0).length,
    };
  }
}
