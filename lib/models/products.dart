/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 1/14/2025, 5:48 PM
*/


import 'package:pos_mobile/core/constants/pref_keys.dart';
import 'package:pos_mobile/hive_helper/app_prefs.dart';
import 'package:pos_mobile/models/measurement_unit.dart';
import 'package:pos_mobile/models/measurement_values.dart';
import 'package:pos_mobile/models/only_product.dart';
import 'package:pos_mobile/models/shop_prices.dart';
import 'package:pos_mobile/models/vat.dart';
  final AppPrefs prefs = AppPrefs.instance;

class Products {
  List<ProductForProductList>? data;
  String? total;

  Products({this.data, this.total});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductForProductList>[];
      json['data'].forEach((v) {
        data!.add(ProductForProductList.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class ProductForProductList {
  String? id;
  String? sku;
  String? name;
  String? image;
  bool? isMarking;
  bool? isActive;
  String? mxikCode;
  String? parentId;
  String? companyId;
  String? createdAt;
  String? description;
  dynamic createdBy;
  String? productTypeId;
  List<String>? barcode;
  ShopPricesSub? shopPrices;
  List<ProductCategories>? categories;
  MeasurementUnit? measurementUnit;
  Vat? vat;
  MeasurementValuesSub? measurementValues;
  num? updatedAt;
  String? packageCode;
  String? packageType;
  String? packageName;
  String? lastUpdatedTime;
  bool? serialNumber;
  String? ownerType;

  ProductForProductList({this.id,
    this.sku,
    this.name,
    this.image,
    this.isMarking,
    this.isActive,
    this.mxikCode,
    this.parentId,
    this.companyId,
    this.createdAt,
    this.description,
    this.createdBy,
    this.productTypeId,
    this.barcode,
    this.shopPrices,
    this.categories,
    this.measurementUnit,
    this.vat,
    this.measurementValues,
    this.updatedAt,
    this.packageCode,
    this.packageType,
    this.packageName,
    this.lastUpdatedTime,
    this.serialNumber,
    this.ownerType});

  ProductForProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    image = json['image'];
    isMarking = json['is_marking'];
    isActive = json['is_active'];
    mxikCode = json['mxik_code'];
    parentId = json['parent_id'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    description = json['description'];
    createdBy = json['created_by'];
    productTypeId = json['product_type_id'];
    barcode = json['barcode'].cast<String>();
    shopPrices = json['shop_prices'] != null
        ? ShopPricesSub.fromJson(json['shop_prices'])
        : null;
    if (json['categories'] != null) {
      categories = <ProductCategories>[];
      json['categories'].forEach((v) {
        categories!.add(ProductCategories.fromJson(v));
      });
    }
    measurementUnit = json['measurement_unit'] != null
        ? MeasurementUnit.fromJson(json['measurement_unit'])
        : null;
    vat = json['vat'] != null ? Vat.fromJson(json['vat']) : null;
    measurementValues = json['measurement_values'] != null
        ? MeasurementValuesSub.fromJson(json['measurement_values'])
        : null;
    updatedAt = json['updated_at'];
    packageCode = json['package_code'];
    packageType = json['package_type'];
    packageName = json['package_name'];
    lastUpdatedTime = json['last_updated_time'];
    serialNumber = json['serial_number'];
    ownerType = json['owner_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['name'] = name;
    data['image'] = image;
    data['is_marking'] = isMarking;
    data['is_active'] = isActive;
    data['mxik_code'] = mxikCode;
    data['parent_id'] = parentId;
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['created_by'] = createdBy;
    data['product_type_id'] = productTypeId;
    data['barcode'] = barcode;
    if (shopPrices != null) {
      data['shop_prices'] = shopPrices!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (measurementUnit != null) {
      data['measurement_unit'] = measurementUnit!.toJson();
    }
    if (vat != null) {
      data['vat'] = vat!.toJson();
    }
    if (measurementValues != null) {
      data['measurement_values'] = measurementValues!.toJson();
    }
    data['updated_at'] = updatedAt;
    data['package_code'] = packageCode;
    data['package_type'] = packageType;
    data['package_name'] = packageName;
    data['last_updated_time'] = lastUpdatedTime;
    data['serial_number'] = serialNumber;
    data['owner_type'] = ownerType;
    return data;
  }
}

class ShopPricesSub {
  ShopPrices? shId;

  ShopPricesSub({this.shId});

  ShopPricesSub.fromJson(Map<String, dynamic> json) {
    shId = json[prefs.getString(PrefKeys.shopId,)] != null
        ? ShopPrices.fromJson(json[prefs.getString(PrefKeys.shopId,)])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (shId != null) {
      data[prefs.getString(PrefKeys.shopId,)] = shId!.toJson();
    }
    return data;
  }
}

class MeasurementValuesSub {
  MeasurementValues? shopId;

  MeasurementValuesSub({this.shopId});

  MeasurementValuesSub.fromJson(Map<String, dynamic> json) {
    shopId = json[prefs.getString(PrefKeys.shopId,)] != null
        ? MeasurementValues.fromJson(json[prefs.getString(PrefKeys.shopId,)])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (shopId != null) {
      data[prefs.getString(PrefKeys.shopId,)] = shopId!.toJson();
    }
    return data;
  }
}
