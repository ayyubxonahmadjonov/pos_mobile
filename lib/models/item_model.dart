// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:hive/hive.dart';
import 'package:pos_mobile/models/measurement_unit.dart';
import 'package:pos_mobile/models/shop_prices.dart';
import 'package:pos_mobile/models/vat.dart';

part 'item_model.g.dart';

@HiveType(typeId: 8)
class ItemModel extends HiveObject {
  @override
  get key => id;

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? sku;
  @HiveField(2)
  String? name;
  @HiveField(3)
  bool? isMarking;
  @HiveField(4)
  bool? isActive;
  @HiveField(5)
  String? mxikCode;
  @HiveField(6)
  String? parentId;
  @HiveField(7)
  String? companyId;
  @HiveField(8)
  String? description;
  @HiveField(9)
  String? productTypeId;
  @HiveField(10)
  ShopPrices? shopPrices;
  @HiveField(11)
  MeasurementUnit? measurementUnit;
  @HiveField(12)
  Vat? vat;
  @HiveField(13)
  String? ownerType;
  @HiveField(14)
  List<String>? barcode;
  @HiveField(15)
  String? boxBarcode;
  @HiveField(16)
  num? boxBarcodeQuantity;
  @HiveField(17)
  bool? hasBoxBarcode;

  ItemModel({
    this.id,
    this.sku,
    this.name,
    this.isMarking,
    this.isActive,
    this.mxikCode,
    this.parentId,
    this.companyId,
    this.description,
    this.productTypeId,
    this.shopPrices,
    this.measurementUnit,
    this.vat,
    this.ownerType,
    this.barcode,
    this.boxBarcode,
    this.boxBarcodeQuantity,
    this.hasBoxBarcode,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    isMarking = json['is_marking'];
    isActive = json['is_active'];
    mxikCode = json['mxik_code'];
    parentId = json['parent_id'];
    companyId = json['company_id'];
    description = json['description'];
    productTypeId = json['product_type_id'];
    barcode = List<String>.from(
      (json["barcode"] ?? <String>[]).map((x) => x.toString()),
    );
    shopPrices = json['shop_prices'] != null
        ? ShopPrices.fromJson(json["shop_prices"])
        : null;
    measurementUnit = json['measurement_unit'] != null
        ? MeasurementUnit.fromJson(json['measurement_unit'])
        : null;
    vat = json['vat'] != null ? Vat.fromJson(json['vat']) : null;
    ownerType = json['owner_type'];
    boxBarcode = json['box_barcode'];
    boxBarcodeQuantity = json['box_barcode_quantity'];
    hasBoxBarcode = json['has_box_barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['sku'] = sku;
    data['name'] = name;
    data['is_marking'] = isMarking;
    data['is_active'] = isActive;
    data['mxik_code'] = mxikCode;
    data['parent_id'] = parentId;
    data['company_id'] = companyId;
    data['description'] = description;
    data['product_type_id'] = productTypeId;
    data["barcode"] = List<dynamic>.from((barcode ?? []).map((x) => x));
    if (shopPrices != null) {
      data['shop_prices'] = shopPrices!.toJson();
    }
    if (measurementUnit != null) {
      data['measurement_unit'] = measurementUnit!.toJson();
    }
    if (vat != null) {
      data['vat'] = vat!.toJson();
    }
    data['owner_type'] = ownerType;
    data['box_barcode'] = boxBarcode;
    data['box_barcode_quantity'] = boxBarcodeQuantity;
    data['has_box_barcode'] = hasBoxBarcode;

    return data;
  }
}
