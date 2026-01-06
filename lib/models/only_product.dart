/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 1/18/2025, 4:20 PM
*/

import 'package:pos_mobile/models/measurement_unit.dart';
import 'package:pos_mobile/models/measurement_values.dart';
import 'package:pos_mobile/models/product/product_model.dart';
import 'package:pos_mobile/models/required_data/shops.dart';
import 'package:pos_mobile/models/shop_prices.dart';
import 'package:pos_mobile/models/vat.dart';

class OnlyProduct {
  List<String>? barcode;
  List<ProductCategories>? categories;
  String? companyId;
  String? createdAt;
  CreatedBy? createdBy;
  List<ProductCustomFields>? customFields;
  String? description;
  String? id;
  List<ProductImages>? images;
  bool? isActive;
  bool? isMarking;
  String? lastUpdatedTime;
  MeasurementUnit? measurementUnit;
  List<MeasurementValues>? measurementValues;
  String? mxikCode;
  String? name;
  bool? noLoyalty;
  String? ownerType;
  String? packageCode;
  String? packageName;
  String? packageType;
  String? parentId;
  String? productTypeId;
  bool? serialNumber;
  List<ShopPrices>? shopPrices;
  String? sku;
  SupplierInProduct? supplier;
  CreatedBy? updatedBy;
  Vat? vat;

  OnlyProduct(
      {this.barcode,
      this.categories,
      this.companyId,
      this.createdAt,
      this.createdBy,
      this.customFields,
      this.description,
      this.id,
      this.images,
      this.isActive,
      this.isMarking,
      this.lastUpdatedTime,
      this.measurementUnit,
      this.measurementValues,
      this.mxikCode,
      this.name,
      this.noLoyalty,
      this.ownerType,
      this.packageCode,
      this.packageName,
      this.packageType,
      this.parentId,
      this.productTypeId,
      this.serialNumber,
      this.shopPrices,
      this.sku,
      this.supplier,
      this.updatedBy,
      this.vat});

  OnlyProduct.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'].cast<String>();
    if (json['categories'] != null) {
      categories = <ProductCategories>[];
      json['categories'].forEach((v) {
        categories!.add(ProductCategories.fromJson(v));
      });
    }
    companyId = json['company_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    if (json['custom_fields'] != null) {
      customFields = <ProductCustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(ProductCustomFields.fromJson(v));
      });
    }
    description = json['description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <ProductImages>[];
      json['images'].forEach((v) {
        images!.add(ProductImages.fromJson(v));
      });
    }
    isActive = json['is_active'];
    isMarking = json['is_marking'];
    lastUpdatedTime = json['last_updated_time'];
    measurementUnit = json['measurement_unit'] != null
        ? MeasurementUnit.fromJson(json['measurement_unit'])
        : null;
    if (json['measurement_values'] != null) {
      measurementValues = <MeasurementValues>[];
      json['measurement_values'].forEach((v) {
        measurementValues!.add(MeasurementValues.fromJson(v));
      });
    }
    mxikCode = json['mxik_code'];
    name = json['name'];
    noLoyalty = json['no_loyalty'];
    ownerType = json['owner_type'];
    packageCode = json['package_code'];
    packageName = json['package_name'];
    packageType = json['package_type'];
    parentId = json['parent_id'];
    productTypeId = json['product_type_id'];
    serialNumber = json['serial_number'];
    if (json['shop_prices'] != null) {
      shopPrices = <ShopPrices>[];
      json['shop_prices'].forEach((v) {
        shopPrices!.add(ShopPrices.fromJson(v));
      });
    }
    sku = json['sku'];
    supplier = json['supplier'] != null
        ? SupplierInProduct.fromJson(json['supplier'])
        : null;
    updatedBy = json['updated_by'] != null
        ? CreatedBy.fromJson(json['updated_by'])
        : null;
    vat = json['vat'] != null ? Vat.fromJson(json['vat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barcode'] = barcode;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['is_active'] = isActive;
    data['is_marking'] = isMarking;
    data['last_updated_time'] = lastUpdatedTime;
    if (measurementUnit != null) {
      data['measurement_unit'] = measurementUnit!.toJson();
    }
    if (measurementValues != null) {
      data['measurement_values'] =
          measurementValues!.map((v) => v.toJson()).toList();
    }
    data['mxik_code'] = mxikCode;
    data['name'] = name;
    data['no_loyalty'] = noLoyalty;
    data['owner_type'] = ownerType;
    data['package_code'] = packageCode;
    data['package_name'] = packageName;
    data['package_type'] = packageType;
    data['parent_id'] = parentId;
    data['product_type_id'] = productTypeId;
    data['serial_number'] = serialNumber;
    if (shopPrices != null) {
      data['shop_prices'] = shopPrices!.map((v) => v.toJson()).toList();
    }
    data['sku'] = sku;
    if (supplier != null) {
      data['supplier'] = supplier!.toJson();
    }
    if (updatedBy != null) {
      data['updated_by'] = updatedBy!.toJson();
    }
    if (vat != null) {
      data['vat'] = vat!.toJson();
    }
    return data;
  }

  factory OnlyProduct.fromProduct(Product p) {
    return OnlyProduct(
      id: p.id,
      sku: p.sku,
      name: p.name,
      barcode: p.barcode,
      description: p.description,
      isActive: p.isActive,
      isMarking: p.isMarking,
      mxikCode: p.mxikCode,
      parentId: p.parentId,
      companyId: p.companyId,
      createdAt: p.createdAt,
      productTypeId: p.productTypeId,
      lastUpdatedTime: p.lastUpdatedTime,
      serialNumber: p.serialNumber,
      ownerType: p.ownerType,
      noLoyalty: false,

      vat: p.vat,
      measurementUnit: p.measurementUnit,

      measurementValues: p.measurementValues == null
          ? []
          : [
              MeasurementValues(
                shopId: p.measurementValues?.shopId.toString(),
                shopName:
                    p.measurementValues?.shopId?.shopName?.toString() ?? '',
                amount: p.measurementValues?.shopId?.amount,
                smallLeft: p.measurementValues?.shopId?.smallLeft,
                hasTrigger: p.measurementValues?.shopId?.hasTrigger,
                isAvailable: p.measurementValues?.shopId?.isAvailable,
              )
            ],

      categories: p.categories,

      shopPrices: p.shopPrices == null
          ? []
          : [
              ShopPrices(
                shopId: p.shopPrices?.shId?.shopId.toString(),
                shopName: p.shopPrices!.shId?.shopName.toString() ?? '',
                supplyPrice: p.shopPrices?.shId?.supplyPrice,
                retailPrice: p.shopPrices?.shId?.retailPrice,
                lastSupplyPrice: p.shopPrices?.shId?.lastSupplyPrice,
                shopPriceTiers: p.shopPrices?.shId?.shopPriceTiers,
              )
            ],

      createdBy: p.createdBy,

      // updatedBy yo‘q → yubormaymiz
    );
  }
}

class ProductCategories {
  String? id;
  String? name;
  String? parentId;

  ProductCategories({this.id, this.name, this.parentId});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parent_id'] = parentId;
    return data;
  }
}

class ProductCustomFields {
  String? customField;
  String? customFieldName;
  String? customFieldType;
  String? value;

  ProductCustomFields(
      {this.customField,
      this.customFieldName,
      this.customFieldType,
      this.value});

  ProductCustomFields.fromJson(Map<String, dynamic> json) {
    customField = json['custom_field'];
    customFieldName = json['custom_field_name'];
    customFieldType = json['custom_field_type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['custom_field'] = customField;
    data['custom_field_name'] = customFieldName;
    data['custom_field_type'] = customFieldType;
    data['value'] = value;
    return data;
  }
}

class ProductImages {
  String? imageUrl;
  num? sequenceNumber;

  ProductImages({this.imageUrl, this.sequenceNumber});

  ProductImages.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    sequenceNumber = json['sequence_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['sequence_number'] = sequenceNumber;
    return data;
  }
}

class SupplierInProduct {
  String? id;
  String? name;

  SupplierInProduct({this.id, this.name});

  SupplierInProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
