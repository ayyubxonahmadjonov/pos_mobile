// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_getters_setters

/*

  Created by: Bakhromjon Polat
  Created on: Feb 25 2023 10:44:31
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/product/product_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: HiveTypes.order, adapterName: HiveAdapters.orderModelAdapter)
class OrderModel extends HiveObject {
  @override
  get key => _sId;

  @HiveField(0)
  String? _note;

  @HiveField(1)
  String? _sId;

  @HiveField(2)
  String? _organizationId;

  @HiveField(3)
  String? _serviceId;

  @HiveField(4)
  String? _employeeId;

  @HiveField(5)
  int? _date;

  @HiveField(6)
  String? _sectorName;

  @HiveField(7)
  int? _requiredDate;

  @HiveField(8)
  int? _acceptDate;

  @HiveField(9)
  int? _itemsCount;

  @HiveField(10)
  int? _acceptItemsCount;

  @HiveField(11)
  String? _acceptById;

  @HiveField(12)
  String? _acceptByName;

  @HiveField(13)
  List<OrderItem>? _items;

  @HiveField(14)
  String? _organizationName;

  @HiveField(15)
  String? _serviceName;

  @HiveField(16)
  String? _status;

  @HiveField(17)
  String? _employeeName;

  @HiveField(18)
  String? _pOrder;

  @HiveField(19)
  String? _createdAt;

  @HiveField(20)
  String? _updatedAt;

  OrderModel({
    String? note,
    String? sId,
    String? organizationId,
    String? serviceId,
    String? employeeId,
    int? date,
    String? sectorName,
    int? requiredDate,
    int? acceptDate,
    int? itemsCount,
    int? acceptItemsCount,
    String? acceptById,
    String? acceptByName,
    List<OrderItem>? items,
    String? organizationName,
    String? serviceName,
    String? status,
    String? employeeName,
    String? pOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    if (note != null) {
      _note = note;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (organizationId != null) {
      _organizationId = organizationId;
    }
    if (serviceId != null) {
      _serviceId = serviceId;
    }
    if (employeeId != null) {
      _employeeId = employeeId;
    }
    if (date != null) {
      _date = date;
    }
    if (sectorName != null) {
      _sectorName = sectorName;
    }
    if (requiredDate != null) {
      _requiredDate = requiredDate;
    }
    if (acceptDate != null) {
      _acceptDate = acceptDate;
    }
    if (itemsCount != null) {
      _itemsCount = itemsCount;
    }
    if (acceptItemsCount != null) {
      _acceptItemsCount = acceptItemsCount;
    }
    if (acceptById != null) {
      _acceptById = acceptById;
    }
    if (acceptByName != null) {
      _acceptByName = acceptByName;
    }
    if (items != null) {
      _items = items;
    }
    if (organizationName != null) {
      _organizationName = organizationName;
    }
    if (serviceName != null) {
      _serviceName = serviceName;
    }
    if (status != null) {
      _status = status;
    }
    if (employeeName != null) {
      _employeeName = employeeName;
    }
    if (pOrder != null) {
      _pOrder = pOrder;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  String get note => _note ?? "";
  set note(String? note) => _note = note;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get organizationId => _organizationId;
  set organizationId(String? organizationId) =>
      _organizationId = organizationId;
  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  String? get employeeId => _employeeId;
  set employeeId(String? employeeId) => _employeeId = employeeId;
  int? get date => _date;
  set date(int? date) => _date = date;
  String? get sectorName => _sectorName;
  set sectorName(String? sectorName) => _sectorName = sectorName;
  int get requiredDate => _requiredDate ?? 0;
  set requiredDate(int? requiredDate) => _requiredDate = requiredDate;
  int? get acceptDate => _acceptDate;
  set acceptDate(int? acceptDate) => _acceptDate = acceptDate;
  int get itemsCount => _itemsCount ?? 0;
  set itemsCount(int? itemsCount) => _itemsCount = itemsCount;
  int get acceptItemsCount => _acceptItemsCount ?? 0;
  set acceptItemsCount(int? acceptItemsCount) =>
      _acceptItemsCount = acceptItemsCount;
  String? get acceptById => _acceptById;
  set acceptById(String? acceptById) => _acceptById = acceptById;
  String? get acceptByName => _acceptByName;
  set acceptByName(String? acceptByName) => _acceptByName = acceptByName;
  List<OrderItem> get items => _items ?? [];
  set items(List<OrderItem>? items) => _items = items;
  String? get organizationName => _organizationName;
  set organizationName(String? organizationName) =>
      _organizationName = organizationName;
  String? get serviceName => _serviceName;
  set serviceName(String? serviceName) => _serviceName = serviceName;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get pOrder => _pOrder;
  set pOrder(String? pOrder) => _pOrder = pOrder;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  OrderModel.fromJson(Map<String, dynamic> json) {
    _note = json['note'];
    _sId = json['_id'];
    _organizationId = json['organization_id'];
    _serviceId = json['service_id'];
    _employeeId = json['employee_id'];
    _date = json['date'];
    _sectorName = json['sector_name'];
    _requiredDate = json['required_date'];
    _acceptDate = json['accept_date'];
    _itemsCount = json['items_count'];
    _acceptItemsCount = json['accept_items_count'];
    _acceptById = json['accept_by_id'];
    _acceptByName = json['accept_by_name'];
    if (json['items'] != null) {
      _items = <OrderItem>[];
      json['items'].forEach((v) {
        _items!.add(OrderItem.fromJson(v));
      });
    }
    _organizationName = json['organization_name'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _employeeName = json['employee_name'];
    _pOrder = json['p_order'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['note'] = _note;
    data['_id'] = _sId;
    data['organization_id'] = _organizationId;
    data['service_id'] = _serviceId;
    data['employee_id'] = _employeeId;
    data['date'] = _date;
    data['sector_name'] = _sectorName;
    data['required_date'] = _requiredDate;
    data['accept_date'] = _acceptDate;
    data['items_count'] = _itemsCount;
    data['accept_items_count'] = _acceptItemsCount;
    data['accept_by_id'] = _acceptById;
    data['accept_by_name'] = _acceptByName;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['organization_name'] = _organizationName;
    data['service_name'] = _serviceName;
    data['status'] = _status;
    data['employee_name'] = _employeeName;
    data['p_order'] = _pOrder;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toApi() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organization_id'] = _organizationId;
    data['service_id'] = _serviceId;
    data['employee_id'] = _employeeId;
    data['date'] = _date;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['required_date'] = _requiredDate;
    data['note'] = _note;

    return data;
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other._sId == _sId;
  }

  @override
  int get hashCode {
    return _sId.hashCode;
  }
}

@HiveType(
  typeId: HiveTypes.orderItem,
  adapterName: HiveAdapters.orderItemAdapter,
)
class OrderItem {
  @HiveField(0)
  String? _productId;

  @HiveField(1)
  String? _productName;

  @HiveField(2)
  num? _productSku;

  @HiveField(3)
  String? _sectorName;

  @HiveField(4)
  int? _date;

  @HiveField(5)
  num? _inStock;

  @HiveField(6)
  num? _realStock;

  @HiveField(7)
  List<String>? _barcode;

  @HiveField(8)
  num? _orderQuantity;

  @HiveField(9)
  String? _note;

  @HiveField(10)
  bool? _isAccept;

  OrderItem({
    String? productId,
    String? productName,
    num? productSku,
    String? sectorName,
    int? date,
    num? inStock,
    num? realStock,
    List<String>? barcode,
    num? orderQuantity,
    String? note,
    bool? isAccept,
  }) {
    if (productId != null) {
      _productId = productId;
    }
    if (productName != null) {
      _productName = productName;
    }
    if (productSku != null) {
      _productSku = productSku;
    }
    if (sectorName != null) {
      _sectorName = sectorName;
    }
    if (date != null) {
      _date = date;
    }
    if (inStock != null) {
      _inStock = inStock;
    }
    if (realStock != null) {
      _realStock = realStock;
    }
    if (barcode != null) {
      _barcode = barcode;
    }
    if (orderQuantity != null) {
      _orderQuantity = orderQuantity;
    }
    if (note != null) {
      _note = note;
    }

    if (isAccept != null) {
      _isAccept = isAccept;
    }
  }

  String? get productId => _productId;
  set productId(String? productId) => _productId = productId;
  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  num? get productSku => _productSku;
  set productSku(num? productSku) => _productSku = productSku;
  String? get sectorName => _sectorName;
  set sectorName(String? sectorName) => _sectorName = sectorName;
  int? get date => _date;
  set date(int? date) => _date = date;
  num get inStock => _inStock ?? 0;
  set inStock(num? inStock) => _inStock = inStock;
  num? get realStock => _realStock;
  set realStock(num? realStock) => _realStock = realStock;
  List<String>? get barcode => _barcode;
  set barcode(List<String>? barcode) => _barcode = barcode;
  num? get orderQuantity => _orderQuantity;
  set orderQuantity(num? orderQuantity) => _orderQuantity = orderQuantity;
  String? get note => _note;
  set note(String? note) => _note = note;
  bool get isAccept => _isAccept ?? false;
  set accept(bool? isAccept) => _isAccept = isAccept;

  OrderItem.fromJson(Map<String, dynamic> json) {
    _productId = json['product_id'];
    _productName = json['product_name'];
    _productSku = json['product_sku'];
    _sectorName = json['sector_name'];
    _date = json['date'];
    _inStock = json['in_stock'];
    _realStock = json['real_stock'];
    _barcode = json['barcode'].cast<String>();
    _orderQuantity = json['order_quantity'];
    _note = json['note'];
    _isAccept = json['is_accept'];
  }

  OrderItem.fromProduct(Product product) {
    _barcode = product.barcode;
    // _realStock = product.realStock;
    _inStock = product.measurementValues?.shopId?.amount ?? 0;
    _productId = product.id;
    _productName = product.name;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = _productId;
    data['product_name'] = _productName;
    data['product_sku'] = _productSku;
    data['sector_name'] = _sectorName;
    data['date'] = _date;
    data['in_stock'] = _inStock;
    data['real_stock'] = _realStock;
    data['barcode'] = _barcode;
    data['order_quantity'] = _orderQuantity;
    data['note'] = _note;
    data['is_accept'] = _isAccept;
    return data;
  }

  OrderItem copyWith({
    String? productId,
    String? productName,
    num? productSku,
    String? sectorName,
    int? date,
    num? inStock,
    num? realStock,
    List<String>? barcode,
    num? orderQuantity,
    String? note,
    bool? isAccept,
  }) {
    return OrderItem(
      productId: _productId ?? _productId,
      productName: _productName ?? _productName,
      productSku: _productSku ?? _productSku,
      sectorName: _sectorName ?? _sectorName,
      date: _date ?? _date,
      inStock: _inStock ?? _inStock,
      realStock: _realStock ?? _realStock,
      barcode: _barcode ?? _barcode,
      orderQuantity: _orderQuantity ?? _orderQuantity,
      note: _note ?? _note,
      isAccept: _isAccept ?? _isAccept,
    );
  }

  String getInStock() {
    if (_inStock.runtimeType == int) {
      return _inStock.toString();
    }
    return (_inStock ?? 0).toStringAsFixed(2);
  }
}
