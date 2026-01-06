/*
    @author Ayyubxon Ahmadjonov, 2/24/2025, 5:02 PM
*/


import 'package:pos_mobile/models/measurement_values.dart';
import 'package:pos_mobile/models/only_product.dart';
import 'package:pos_mobile/models/shop_prices.dart';

class ProductCreateRequest {
  List<String>? barcode;
  String? brandId;
  List<String>? categoryIds;
  List<ProductCustomFields>? customFields;
  String? description;
  List<ProductImages>? images;
  bool? isActive;
  bool? isMarking;
  String? measurementUnitId;
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
  String? supplierId;
  List<String>? tagIds;
  String? vatId;

  ProductCreateRequest(
      {this.barcode,
      this.brandId,
      this.categoryIds,
      this.customFields,
      this.description,
      this.images,
      this.isActive,
      this.isMarking,
      this.measurementUnitId,
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
      this.supplierId,
      this.tagIds,
      this.vatId});

  ProductCreateRequest.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'].cast<String>();
    brandId = json['brand_id'];
    categoryIds = json['category_ids'].cast<String>();
    if (json['custom_fields'] != null) {
      customFields = <ProductCustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(ProductCustomFields.fromJson(v));
      });
    }
    description = json['description'];
    if (json['images'] != null) {
      images = <ProductImages>[];
      json['images'].forEach((v) {
        images!.add(ProductImages.fromJson(v));
      });
    }
    isActive = json['is_active'];
    isMarking = json['is_marking'];
    measurementUnitId = json['measurement_unit_id'];
    if (json['measurement_values'] != null) {
      measurementValues = <MeasurementValues>[];
      json['measurement_values'].forEach((v) {
        measurementValues!.add(MeasurementValues.fromJson(v));
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
        shopPrices!.add(ShopPrices.fromJson(v));
      });
    }
    sku = json['sku'];
    supplierId = json['supplier_id'];
    tagIds = json['tag_ids'].cast<String>();
    vatId = json['vat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barcode'] = barcode;
    data['brand_id'] = brandId;
    data['category_ids'] = categoryIds;
    if (customFields != null) {
      data['custom_fields'] =
          customFields!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['is_active'] = isActive;
    data['is_marking'] = isMarking;
    data['measurement_unit_id'] = measurementUnitId;
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
    data['supplier_id'] = supplierId;
    data['tag_ids'] = tagIds;
    data['vat_id'] = vatId;
    return data;
  }
}
