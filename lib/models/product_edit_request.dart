/*
    @author Ayyubxon Ahmadjonov, 1/22/2025, 3:29 PM
*/


import 'package:pos_mobile/models/shop_prices.dart';

class ProductEditRequest {
  List<String>? barcode;
  String? brandId;
  List<String>? categoryIds;
  List<CustomFields>? customFields;
  String? description;
  List<Images>? images;
  bool? isActive;
  bool? isMarking;
  String? measurementUnitId;
  List<MeasurementValuesForEdit>? measurementValues;
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
  List<ShopPricesForEdit>? shopPrices;
  String? sku;
  String? supplierId;
  List<String>? tagIds;
  String? vatId;

  ProductEditRequest({
    required this.barcode,
    required this.categoryIds,
    required this.customFields,
    required this.description,
    required this.images,
    required this.isActive,
    required this.isMarking,
    required this.measurementUnitId,
    required this.measurementValues,
    required this.mxikCode,
    required this.name,
    required this.noLoyalty,
    required this.ownerType,
    required this.packageCode,
    required this.packageName,
    required this.packageType,
    required this.parentId,
    required this.productTypeId,
    required this.serialNumber,
    required this.shopPrices,
    required this.sku,
    required this.supplierId,
    required this.vatId,
    this.brandId,
    this.tagIds,
  });

  ProductEditRequest.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'].cast<String>();
    brandId = json['brand_id'];
    categoryIds = json['category_ids'].cast<String>();
    if (json['custom_fields'] != null) {
      customFields = <CustomFields>[];
      json['custom_fields'].forEach((v) {
        customFields!.add(CustomFields.fromJson(v));
      });
    }
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    isActive = json['is_active'];
    isMarking = json['is_marking'];
    measurementUnitId = json['measurement_unit_id'];
    if (json['measurement_values'] != null) {
      measurementValues = <MeasurementValuesForEdit>[];
      json['measurement_values'].forEach((v) {
        measurementValues!.add(MeasurementValuesForEdit.fromJson(v));
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
      shopPrices = <ShopPricesForEdit>[];
      json['shop_prices'].forEach((v) {
        shopPrices!.add(ShopPricesForEdit.fromJson(v));
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

class CustomFields {
  String? customField;
  String? customFieldName;
  String? customFieldType;
  String? value;

  CustomFields(
      {this.customField,
      this.customFieldName,
      this.customFieldType,
      this.value});

  CustomFields.fromJson(Map<String, dynamic> json) {
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

class Images {
  String? imageUrl;
  num? sequenceNumber;

  Images({this.imageUrl, this.sequenceNumber});

  Images.fromJson(Map<String, dynamic> json) {
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

class MeasurementValuesForEdit {
  num? amount;
  bool? hasTrigger;
  bool? isAvailable;
  String? shopId;
  String? shopName;
  num? smallLeft;

  MeasurementValuesForEdit(
      {this.amount,
      this.hasTrigger,
      this.isAvailable,
      this.shopId,
      this.shopName,
      this.smallLeft});

  MeasurementValuesForEdit.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    hasTrigger = json['has_trigger'];
    isAvailable = json['is_available'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    smallLeft = json['small_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['has_trigger'] = hasTrigger;
    data['is_available'] = isAvailable;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['small_left'] = smallLeft;
    return data;
  }
}

class ShopPricesForEdit {
  num? lastSupplyPrice;
  num? retailPrice;
  String? shopId;
  String? shopName;
  num? supplyPrice;
  List<ShopPriceTiers>? shopPriceTiers;

  ShopPricesForEdit({
    this.lastSupplyPrice,
    this.retailPrice,
    this.shopId,
    this.shopName,
    this.supplyPrice,
    this.shopPriceTiers,
  });

  ShopPricesForEdit.fromJson(Map<String, dynamic> json) {
    lastSupplyPrice = json['last_supply_price'];
    retailPrice = json['retail_price'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    supplyPrice = json['supply_price'];
    if (json['shop_price_tiers'] != null) {
      shopPriceTiers = <ShopPriceTiers>[];
      json['shop_price_tiers'].forEach((v) {
        shopPriceTiers!.add(ShopPriceTiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_supply_price'] = lastSupplyPrice;
    data['retail_price'] = retailPrice;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['supply_price'] = supplyPrice;
    if (shopPriceTiers != null) {
      data['shop_price_tiers'] =
          shopPriceTiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
