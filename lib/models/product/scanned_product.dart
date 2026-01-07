

import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/models/only_product.dart';
import 'package:pos_mobile/models/product_service/product_service.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/models/measurement_unit.dart';
import 'package:pos_mobile/models/vat.dart';

part 'scanned_product.g.dart';

@HiveType(typeId: 11,)
class ScannedProduct extends HiveObject {
  @override
  String get key => id ?? '';

  /// ========================
  /// API fields (Basic types only for Hive)
  /// ========================
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? sku;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? image;

  @HiveField(4)
  bool? isMarking;

  @HiveField(5)
  bool? isActive;

  @HiveField(6)
  String? mxikCode;

  @HiveField(7)
  String? parentId;

  @HiveField(8)
  String? companyId;

  @HiveField(9)
  String? createdAt;

  @HiveField(10)
  String? description;

  @HiveField(11)
  String? productTypeId;

  @HiveField(12)
  List<String>? barcode;

  @HiveField(13)
  num? updatedAt;

  @HiveField(17)
  String? lastUpdatedTime;

  @HiveField(18)
  bool? serialNumber;

  @HiveField(19)
  String? ownerType;

  @HiveField(20)
  String? _shopPricesJson;

  @HiveField(21)
  String? _categoriesJson;

  @HiveField(22)
  String? _measurementUnitJson;

  @HiveField(23)
  String? _vatJson;

  @HiveField(24)
  String? _measurementValuesJson;

  @HiveField(25)
  String? _createdByJson;

  /// ========================
  /// App-side fields
  /// ========================
  @HiveField(26)
  num _realStock = 0;

  @HiveField(27)
  bool _isScanned = false;

  @HiveField(28)
  num? _amount;

  @HiveField(29)
  num? _cost;

  @HiveField(30)
  num? _purchaseCost;

  @HiveField(31)
  num? _quantity;

  @HiveField(32)
  num? _toReceive;

  @HiveField(33)
  num? _received;

  @HiveField(34)
  num? _defaultCost;

  @HiveField(35)
  String? _productName;

  @HiveField(36)
  String? _primarySupplierId;

  @HiveField(37)
  String? _primarySupplierName;

  @HiveField(38)
  String? _servicesJson;

  @HiveField(39)
  num? originalAmount;
  
  @HiveField(40)
  num? updateAmount;

  @HiveField(41)
  bool? isScannedProduct;

  /// ========================
  /// Transient fields (memory only)
  /// ========================
  ShopPricesSub? _shopPrices;
  List<ProductCategories>? _categories;
  MeasurementUnit? _measurementUnit;
  Vat? _vat;
  MeasurementValuesSub? _measurementValues;
  dynamic _createdBy;
  List<ProductService>? _services;

  /// ========================
  /// Getters for complex objects (lazy loading)
  /// ========================
  ShopPricesSub? get shopPrices {
    if (_shopPrices == null && _shopPricesJson != null) {
      try {
        _shopPrices = ShopPricesSub.fromJson(jsonDecode(_shopPricesJson!));
      } catch (e) {
        print('Error decoding shopPrices: $e');
      }
    }
    return _shopPrices;
  }

  List<ProductCategories>? get categories {
    if (_categories == null && _categoriesJson != null) {
      try {
        final List<dynamic> decoded = jsonDecode(_categoriesJson!);
        _categories =
            decoded.map((e) => ProductCategories.fromJson(e)).toList();
      } catch (e) {
        print('Error decoding categories: $e');
      }
    }
    return _categories;
  }

  MeasurementUnit? get measurementUnit {
    if (_measurementUnit == null && _measurementUnitJson != null) {
      try {
        _measurementUnit =
            MeasurementUnit.fromJson(jsonDecode(_measurementUnitJson!));
      } catch (e) {
        print('Error decoding measurementUnit: $e');
      }
    }
    return _measurementUnit;
  }

  Vat? get vat {
    if (_vat == null && _vatJson != null) {
      try {
        _vat = Vat.fromJson(jsonDecode(_vatJson!));
      } catch (e) {
        print('Error decoding vat: $e');
      }
    }
    return _vat;
  }

  MeasurementValuesSub? get measurementValues {
    if (_measurementValues == null && _measurementValuesJson != null) {
      try {
        _measurementValues =
            MeasurementValuesSub.fromJson(jsonDecode(_measurementValuesJson!));
      } catch (e) {
        print('Error decoding measurementValues: $e');
      }
    }
    return _measurementValues;
  }

  dynamic get createdBy {
    if (_createdBy == null && _createdByJson != null) {
      try {
        _createdBy = jsonDecode(_createdByJson!);
      } catch (e) {
        print('Error decoding createdBy: $e');
      }
    }
    return _createdBy;
  }

  List<ProductService> get services {
    if (_services == null && _servicesJson != null) {
      try {
        final List<dynamic> decoded = jsonDecode(_servicesJson!);
        _services = decoded.map((e) => ProductService.fromJson(e)).toList();
      } catch (e) {
        print('Error decoding services: $e');
      }
    }
    return _services ?? [];
  }

  /// ========================
  /// App-side getters/setters
  /// ========================
  num get realStock => _realStock;
  bool get isScanned => _isScanned;
  num get toReceive => _toReceive ?? 0;
  num get received => _received ?? 0;
  String get primarySupplierId => _primarySupplierId ?? "";
  String get primarySupplierName => _primarySupplierName ?? "";
  num get cost => _cost ?? 0;
  num get amount => _amount ?? 0;
  num get purchaseCost => _purchaseCost ?? 0;
  num get quantity => _quantity ?? 0;
  num get defaultCost => _defaultCost ?? 0;
  String? get productName => _productName;

  set setRealStock(num val) => _realStock = val;
  set setIsScanned(bool val) => _isScanned = val;
  set setToReceive(num val) => _toReceive = val;
  set setReceived(num val) => _received = val;
  set setCost(num val) => _cost = val;
  set setAmount(num val) => _amount = val;
  set setPurchaseCost(num val) => _purchaseCost = val;
  set setQuantity(num val) => _quantity = val;
  set setDefaultCost(num val) => _defaultCost = val;
  set setProductName(String? val) => _productName = val;
  set setServices(List<ProductService>? val) {
    _services = val;
    if (val != null) {
      _servicesJson = jsonEncode(val.map((e) => e.toJson()).toList());
    }
  }

  /// ========================
  /// Constructor
  /// ========================
  ScannedProduct({
    this.id,
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
    this.originalAmount,
    this.updateAmount,
    dynamic createdBy,
    this.productTypeId,
    this.barcode,
    ShopPricesSub? shopPrices,
    MeasurementUnit? measurementUnit,
    Vat? vat,
    MeasurementValuesSub? measurementValues,
    this.updatedAt,
    this.lastUpdatedTime,
    this.serialNumber,
    this.ownerType,
    num realStock = 0,
    bool isScanned = false,
    num? amount,
    num? cost,
    num? purchaseCost,
    num? quantity,
    num? toReceive,
    num? received,
    num? defaultCost,
    String? productName,
    String? primarySupplierId,
    String? primarySupplierName,
    List<ProductService>? services,
  }) {
    _realStock = realStock;
    _isScanned = isScanned;
    _amount = amount;
    _cost = cost;
    _purchaseCost = purchaseCost;
    _quantity = quantity;
    _toReceive = toReceive;
    _received = received;
    _defaultCost = defaultCost;
    _productName = productName;
    _primarySupplierId = primarySupplierId;
    _primarySupplierName = primarySupplierName;

    // Complex objects
    _shopPrices = shopPrices;
    _categories = categories;
    _measurementUnit = measurementUnit;
    _vat = vat;
    _measurementValues = measurementValues;
    _createdBy = createdBy;
    _services = services;

    // Encode to JSON
    encodeComplexFields();
  }

  /// ========================
  /// Factory constructors
  /// ========================
  factory ScannedProduct.fromApiModel(ProductForProductList api) {
    return ScannedProduct(
      id: api.id ?? '',
      sku: api.sku ?? '',
      name: api.name ?? '',
      image: api.image,
      isMarking: api.isMarking ?? false,
      isActive: api.isActive ?? false,
      mxikCode: api.mxikCode,
      parentId: api.parentId,
      companyId: api.companyId,
      createdAt: api.createdAt,
      description: api.description,
      createdBy: api.createdBy,
      productTypeId: api.productTypeId,
      barcode: api.barcode ?? [],
      shopPrices: api.shopPrices,
      measurementUnit: api.measurementUnit,
      vat: api.vat,
      measurementValues: api.measurementValues,
      updatedAt: api.updatedAt,
      lastUpdatedTime: api.lastUpdatedTime,
      serialNumber: api.serialNumber ?? false,
      ownerType: api.ownerType,
    );
  }

ScannedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    image = json['image'];
    isMarking = json['isMarking'];
    isActive = json['isActive'];
    mxikCode = json['mxikCode'];
    parentId = json['parentId'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    description = json['description'];
    productTypeId = json['productTypeId'];
    barcode =
        json['barcode'] != null ? List<String>.from(json['barcode']) : null;
    updatedAt = json['updatedAt'];
    lastUpdatedTime = json['lastUpdatedTime'];
    serialNumber = json['serialNumber'];
    ownerType = json['ownerType'];

    // JSON strings
    _shopPricesJson = json['_shopPricesJson'];
    _categoriesJson = json['_categoriesJson'];
    _measurementUnitJson = json['_measurementUnitJson'];
    _vatJson = json['_vatJson'];
    _measurementValuesJson = json['_measurementValuesJson'];
    _createdByJson = json['_createdByJson'];
    _servicesJson = json['_servicesJson'];

    // App-side fields
    _realStock = json['_realStock'] ?? 0;
    _isScanned = json['_isScanned'] ?? false;
    _amount = json['_amount'];
    _cost = json['_cost'];
    _purchaseCost = json['_purchaseCost'];
    _quantity = json['_quantity'];
    _toReceive = json['_toReceive'];
    _received = json['_received'];
    _defaultCost = json['_defaultCost'];
    _productName = json['_productName'];
    _primarySupplierId = json['_primarySupplierId'];
    _primarySupplierName = json['_primarySupplierName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sku'] = sku;
    map['name'] = name;
    map['image'] = image;
    map['isMarking'] = isMarking;
    map['isActive'] = isActive;
    map['mxikCode'] = mxikCode;
    map['parentId'] = parentId;
    map['companyId'] = companyId;
    map['createdAt'] = createdAt;
    map['description'] = description;
    map['productTypeId'] = productTypeId;
    map['barcode'] = barcode;
    map['updatedAt'] = updatedAt;
    map['lastUpdatedTime'] = lastUpdatedTime;
    map['serialNumber'] = serialNumber;
    map['ownerType'] = ownerType;
    map['_shopPricesJson'] = _shopPricesJson;
    map['_categoriesJson'] = _categoriesJson;
    map['_measurementUnitJson'] = _measurementUnitJson;
    map['_vatJson'] = _vatJson;
    map['_measurementValuesJson'] = _measurementValuesJson;
    map['_createdByJson'] = _createdByJson;
    map['_servicesJson'] = _servicesJson;
    map['_realStock'] = _realStock;
    map['_isScanned'] = _isScanned;
    map['_amount'] = _amount;
    map['_cost'] = _cost;
    map['_purchaseCost'] = _purchaseCost;
    map['_quantity'] = _quantity;
    map['_toReceive'] = _toReceive;
    map['_received'] = _received;
    map['_defaultCost'] = _defaultCost;
    map['_productName'] = _productName;
    map['_primarySupplierId'] = _primarySupplierId;
    map['_primarySupplierName'] = _primarySupplierName;
    return map;
  }

  /// ========================
  /// JSON Encoding Methods
  /// ========================

  /// Complex fieldlarni JSON ga encode qilish
  void encodeComplexFields() {
    try {
      if (_shopPrices != null) {
        _shopPricesJson = jsonEncode(_shopPrices!.toJson());
      }
      if (_categories != null) {
        _categoriesJson =
            jsonEncode(_categories!.map((e) => e.toJson()).toList());
      }
      if (_measurementUnit != null) {
        _measurementUnitJson = jsonEncode(_measurementUnit!.toJson());
      }
      if (_vat != null) {
        _vatJson = jsonEncode(_vat!.toJson());
      }
      if (_measurementValues != null) {
        _measurementValuesJson = jsonEncode(_measurementValues!.toJson());
      }
      if (_createdBy != null) {
        _createdByJson = jsonEncode(_createdBy);
      }
      if (_services != null) {
        _servicesJson = jsonEncode(_services!.map((e) => e.toJson()).toList());
      }
    } catch (e, stackTrace) {
      print('❌ Error encoding complex fields: $e');
      print('Stack: $stackTrace');
    }
  }

  /// ========================
  /// Update Methods
  /// ========================

  /// MeasurementValues ni yangilash
  void updateMeasurementValues(MeasurementValuesSub? values) {
    _measurementValues = values;
    if (values != null) {
      try {
        _measurementValuesJson = jsonEncode(values.toJson());
      } catch (e) {
        print('❌ Error encoding measurementValues: $e');
      }
    }
  }

  /// ShopId amount ni yangilash (qulaylik uchun)
  void updateShopAmount(num newAmount) {
    if (_measurementValues?.shopId != null) {
      _measurementValues!.shopId!.amount = newAmount;
      updateMeasurementValues(_measurementValues);
    } else {}
  }

  /// ========================
  /// Hive Methods
  /// ========================

  @override
  Future<void> save() async {
    try {
      encodeComplexFields();

      if (isInBox) {
        await super.save();
      } else {
        throw Exception('Product must be added to box first');
      }
    } catch (e) {
      print('❌ Error in save(): $e');
      rethrow;
    }
  }

  Future<void> increment() async {
    _realStock++;
    await save();
  }

  Future<void> decrement() async {
    if (_realStock <= 0) return;
    _realStock--;
    await save();
  }

  void printDebugInfo() {}

  // Future<void> refreshFromBox() async {
  //   if (id == null || id!.isEmpty) return;

  //   final box = HiveBoxes.productsBox;
  //   final productKey = key.isNotEmpty ? key : id!;

  //   final updatedProduct = box.get(productKey);
  //   if (updatedProduct != null) {
  //     _measurementValuesJson = updatedProduct._measurementValuesJson;
  //     _measurementValues = null;
  //   }
  // }

  /// ========================
  /// Operators
  /// ========================

  @override
  bool operator ==(covariant ScannedProduct other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode => id?.hashCode ?? 0;
}

/// ========================
/// Extension for copyWith
/// ========================
extension ScannedProductCopyWith on ScannedProduct {
  ScannedProduct copyWith({
    String? id,
    String? sku,
    String? name,
    String? image,
    bool? isMarking,
    bool? isActive,
    String? mxikCode,
    String? parentId,
    String? companyId,
    String? createdAt,
    String? description,
    dynamic createdBy,
    String? productTypeId,
    List<String>? barcode,
    ShopPricesSub? shopPrices,
    MeasurementUnit? measurementUnit,
    Vat? vat,
    MeasurementValuesSub? measurementValues,
    num? updatedAt,
    String? lastUpdatedTime,
    bool? serialNumber,
    String? ownerType,
    num? realStock,
    bool? isScanned,
    num? amount,
    num? cost,
    num? purchaseCost,
    num? quantity,
    num? toReceive,
    num? received,
    num? defaultCost,
    String? productName,
    String? primarySupplierId,
    String? primarySupplierName,
    List<ProductService>? services,
  }) {
    return ScannedProduct(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      image: image ?? this.image,
      isMarking: isMarking ?? this.isMarking,
      isActive: isActive ?? this.isActive,
      mxikCode: mxikCode ?? this.mxikCode,
      parentId: parentId ?? this.parentId,
      companyId: companyId ?? this.companyId,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      createdBy: createdBy ?? this.createdBy,
      productTypeId: productTypeId ?? this.productTypeId,
      barcode: barcode ?? this.barcode,
      shopPrices: shopPrices ?? this.shopPrices,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      vat: vat ?? this.vat,
      measurementValues: measurementValues ?? this.measurementValues,
      updatedAt: updatedAt ?? this.updatedAt,
      lastUpdatedTime: lastUpdatedTime ?? this.lastUpdatedTime,
      serialNumber: serialNumber ?? this.serialNumber,
      ownerType: ownerType ?? this.ownerType,
      realStock: realStock ?? this.realStock,
      isScanned: isScanned ?? this.isScanned,
      amount: amount ?? this.amount,
      cost: cost ?? this.cost,
      purchaseCost: purchaseCost ?? this.purchaseCost,
      quantity: quantity ?? this.quantity,
      toReceive: toReceive ?? this.toReceive,
      received: received ?? this.received,
      defaultCost: defaultCost ?? this.defaultCost,
      productName: productName ?? this.productName,
      primarySupplierId: primarySupplierId ?? this.primarySupplierId,
      primarySupplierName: primarySupplierName ?? this.primarySupplierName,
      services: services ?? this.services,
    );
  }
}
