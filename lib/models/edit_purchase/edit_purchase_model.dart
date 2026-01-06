// ignore_for_file: unnecessary_getters_setters

import '../product/product_model.dart';

class EditPurchase {
  bool? _isServiceChangable;
  String? _type;
  String? _status;
  int? _received;
  String? _totalCurrency;
  int? _totalCount;
  bool? _pricingStatus;
  List<Product>? _items;
  String? _sId;
  String? _supplierId;
  int? _purchaseOrderDate;
  int? _expectedOn;
  String? _service;
  String? _notes;
  String? _partiationNo;
  String? _pOrder;
  String? _orderedById;
  String? _orderedByName;
  String? _organization;
  String? _supplierName;
  String? _serviceName;
  int? _total;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  EditPurchase(
      {bool? isServiceChangable,
      String? type,
      String? status,
      int? received,
      String? totalCurrency,
      int? totalCount,
      bool? pricingStatus,
      List<Product>? items,
      String? sId,
      String? supplierId,
      int? purchaseOrderDate,
      int? expectedOn,
      String? service,
      String? notes,
      String? partiationNo,
      String? pOrder,
      String? orderedById,
      String? orderedByName,
      String? organization,
      String? supplierName,
      String? serviceName,
      int? total,
      String? createdAt,
      String? updatedAt,
      int? iV}) {
    if (isServiceChangable != null) {
      _isServiceChangable = isServiceChangable;
    }
    if (type != null) {
      _type = type;
    }
    if (status != null) {
      _status = status;
    }
    if (received != null) {
      _received = received;
    }
    if (totalCurrency != null) {
      _totalCurrency = totalCurrency;
    }
    if (totalCount != null) {
      _totalCount = totalCount;
    }
    if (pricingStatus != null) {
      _pricingStatus = pricingStatus;
    }
    if (items != null) {
      _items = items;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (supplierId != null) {
      _supplierId = supplierId;
    }
    if (purchaseOrderDate != null) {
      _purchaseOrderDate = purchaseOrderDate;
    }
    if (expectedOn != null) {
      _expectedOn = expectedOn;
    }
    if (service != null) {
      _service = service;
    }
    if (notes != null) {
      _notes = notes;
    }
    if (partiationNo != null) {
      _partiationNo = partiationNo;
    }
    if (pOrder != null) {
      _pOrder = pOrder;
    }
    if (orderedById != null) {
      _orderedById = orderedById;
    }
    if (orderedByName != null) {
      _orderedByName = orderedByName;
    }
    if (organization != null) {
      _organization = organization;
    }
    if (supplierName != null) {
      _supplierName = supplierName;
    }
    if (serviceName != null) {
      _serviceName = serviceName;
    }
    if (total != null) {
      _total = total;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (iV != null) {
      _iV = iV;
    }
  }

  bool? get isServiceChangable => _isServiceChangable;
  set isServiceChangable(bool? isServiceChangable) =>
      _isServiceChangable = isServiceChangable;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get status => _status;
  set status(String? status) => _status = status;
  int? get received => _received;
  set received(int? received) => _received = received;
  String? get totalCurrency => _totalCurrency;
  set totalCurrency(String? totalCurrency) => _totalCurrency = totalCurrency;
  int? get totalCount => _totalCount;
  set totalCount(int? totalCount) => _totalCount = totalCount;
  bool? get pricingStatus => _pricingStatus;
  set pricingStatus(bool? pricingStatus) => _pricingStatus = pricingStatus;
  List<Product>? get items => _items;
  set items(List<Product>? items) => _items = items;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get supplierId => _supplierId;
  set supplierId(String? supplierId) => _supplierId = supplierId;
  int? get purchaseOrderDate => _purchaseOrderDate;
  set purchaseOrderDate(int? purchaseOrderDate) =>
      _purchaseOrderDate = purchaseOrderDate;
  int? get expectedOn => _expectedOn;
  set expectedOn(int? expectedOn) => _expectedOn = expectedOn;
  String? get service => _service;
  set service(String? service) => _service = service;
  String? get notes => _notes;
  set notes(String? notes) => _notes = notes;
  String? get partiationNo => _partiationNo;
  set partiationNo(String? partiationNo) => _partiationNo = partiationNo;
  String? get pOrder => _pOrder;
  set pOrder(String? pOrder) => _pOrder = pOrder;
  String? get orderedById => _orderedById;
  set orderedById(String? orderedById) => _orderedById = orderedById;
  String? get orderedByName => _orderedByName;
  set orderedByName(String? orderedByName) => _orderedByName = orderedByName;
  String? get organization => _organization;
  set organization(String? organization) => _organization = organization;
  String? get supplierName => _supplierName;
  set supplierName(String? supplierName) => _supplierName = supplierName;
  String? get serviceName => _serviceName;
  set serviceName(String? serviceName) => _serviceName = serviceName;
  int? get total => _total;
  set total(int? total) => _total = total;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  EditPurchase.fromJson(Map<String, dynamic> json) {
    _isServiceChangable = json['is_service_changable'];
    _type = json['type'];
    _status = json['status'];
    _received = json['received'];
    _totalCurrency = json['total_currency'];
    _totalCount = json['total_count'];
    _pricingStatus = json['pricing_status'];
    if (json['items'] != null) {
      _items = <Product>[];
      json['items'].forEach((v) {
        _items!.add(Product.fromJson(v));
      });
    }
    _sId = json['_id'];
    _supplierId = json['supplier_id'];
    _purchaseOrderDate = json['purchase_order_date'];
    _expectedOn = json['expected_on'];
    _service = json['service'];
    _notes = json['notes'];
    _partiationNo = json['partiation_no'];
    _pOrder = json['p_order'];
    _orderedById = json['ordered_by_id'];
    _orderedByName = json['ordered_by_name'];
    _organization = json['organization'];
    _supplierName = json['supplier_name'];
    _serviceName = json['service_name'];
    _total = json['total'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['is_service_changable'] = _isServiceChangable;
    data['type'] = _type;
    data['status'] = _status;
    data['received'] = _received;
    data['total_currency'] = _totalCurrency;
    data['total_count'] = _totalCount;
    data['pricing_status'] = _pricingStatus;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['_id'] = _sId;
    data['supplier_id'] = _supplierId;
    data['purchase_order_date'] = _purchaseOrderDate;
    data['expected_on'] = _expectedOn;
    data['service'] = _service;
    data['notes'] = _notes;
    data['partiation_no'] = _partiationNo;
    data['p_order'] = _pOrder;
    data['ordered_by_id'] = _orderedById;
    data['ordered_by_name'] = _orderedByName;
    data['organization'] = _organization;
    data['supplier_name'] = _supplierName;
    data['service_name'] = _serviceName;
    data['total'] = _total;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    data['__v'] = _iV;
    return data;
  }
}
