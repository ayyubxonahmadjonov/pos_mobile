import 'package:pos_mobile/models/models.dart';

class Purchase {
  bool? _isServiceChangable;
  String? _type;
  String? _status;
  num? _received;
  String? _totalCurrency;
  num? _totalCount;
  bool? _pricingStatus;
  List<Product>? _items;
  String? _id;
  String? _supplierId;
  num? _purchaseOrderDate;
  num? _expectedOn;
  String? _service;
  String? _notes;
  String? _partiationNo;
  List<num>? _additionalCost;
  String? _pOrder;
  String? _orderedById;
  String? _orderedByName;
  String? _organization;
  String? _supplierName;
  String? _serviceName;
  num? _total;
  String? _createdAt;
  String? _updatedAt;
  String? _refund;
  bool? _sendMessageToSupplier;
  Purchase({
    bool? isServiceChangable,
    String? type,
    String? status,
    num? received,
    String? totalCurrency,
    num? totalCount,
    bool? pricingStatus,
    List<Product>? items,
    String? id,
    String? supplierId,
    num? purchaseOrderDate,
    num? expectedOn,
    String? service,
    String? notes,
    String? partiationNo,
    List<num>? additionalCost,
    String? pOrder,
    String? orderedById,
    String? orderedByName,
    String? organization,
    String? supplierName,
    String? serviceName,
    num? total,
    String? createdAt,
    String? updatedAt,
    String? refund,
    bool? sendMessageToSupplier,
  }) {
    _isServiceChangable = isServiceChangable;
    _type = type;
    _status = status;
    _received = received;
    _totalCurrency = totalCurrency;
    _totalCount = totalCount;
    _pricingStatus = pricingStatus;
    _items = items;
    _id = id;
    _supplierId = supplierId;
    _purchaseOrderDate = purchaseOrderDate;
    _expectedOn = expectedOn;
    _service = service;
    _notes = notes;
    _partiationNo = partiationNo;
    _additionalCost = additionalCost;
    _pOrder = pOrder;
    _orderedById = orderedById;
    _orderedByName = orderedByName;
    _organization = organization;
    _supplierName = supplierName;
    _serviceName = serviceName;
    _total = total;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _refund = refund;
    _sendMessageToSupplier = sendMessageToSupplier;
  }

  Purchase.fromJson(dynamic json) {
    _isServiceChangable = json['is_service_changable'];
    _type = json['type'];
    _status = json['status'];
    _received = json['received'];
    _totalCurrency = json['total_currency'];
    _totalCount = json['total_count'];
    _pricingStatus = json['pricing_status'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Product.fromJson(v));
      });
    }
    _id = json['_id'];
    _supplierId = json['supplier_id'];
    _purchaseOrderDate = json['purchase_order_date'];
    _expectedOn = json['expected_on'];
    _service = json['service'];
    _notes = json['notes'];
    _partiationNo = json['partiation_no'];
    _additionalCost = json['additional_cost'] != null
        ? json['additional_cost'].cast<num>()
        : [];
    _pOrder = json['p_order'];
    _orderedById = json['ordered_by_id'];
    _orderedByName = json['ordered_by_name'];
    _organization = json['organization'];
    _supplierName = json['supplier_name'];
    _serviceName = json['service_name'];
    _total = json['total'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _refund = json['refund'];
    _sendMessageToSupplier = json['send_message_to_supplier'];
  }

  Purchase copyWith({
    bool? isServiceChangable,
    String? type,
    String? status,
    num? received,
    String? totalCurrency,
    num? totalCount,
    bool? pricingStatus,
    List<Product>? items,
    String? id,
    String? supplierId,
    num? purchaseOrderDate,
    num? expectedOn,
    String? service,
    String? notes,
    String? partiationNo,
    List<num>? additionalCost,
    String? pOrder,
    String? orderedById,
    String? orderedByName,
    String? organization,
    String? supplierName,
    String? serviceName,
    num? total,
    String? createdAt,
    String? updatedAt,
    String? refund,
    bool? sendMessageToSupplier,
  }) =>
      Purchase(
        isServiceChangable: isServiceChangable ?? _isServiceChangable,
        type: type ?? _type,
        status: status ?? _status,
        received: received ?? _received,
        totalCurrency: totalCurrency ?? _totalCurrency,
        totalCount: totalCount ?? _totalCount,
        pricingStatus: pricingStatus ?? _pricingStatus,
        items: items ?? _items,
        id: id ?? _id,
        supplierId: supplierId ?? _supplierId,
        purchaseOrderDate: purchaseOrderDate ?? _purchaseOrderDate,
        expectedOn: expectedOn ?? _expectedOn,
        service: service ?? _service,
        notes: notes ?? _notes,
        partiationNo: partiationNo ?? _partiationNo,
        additionalCost: additionalCost ?? _additionalCost,
        pOrder: pOrder ?? _pOrder,
        orderedById: orderedById ?? _orderedById,
        orderedByName: orderedByName ?? _orderedByName,
        organization: organization ?? _organization,
        supplierName: supplierName ?? _supplierName,
        serviceName: serviceName ?? _serviceName,
        total: total ?? _total,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        refund: refund ?? _refund,
        sendMessageToSupplier: sendMessageToSupplier ?? _sendMessageToSupplier,
      );
  bool? get isServiceChangable => _isServiceChangable;
  String? get type => _type;
  String get status => _status ?? "";
  num? get received => _received;
  String? get totalCurrency => _totalCurrency;
  num? get totalCount => _totalCount;
  bool? get pricingStatus => _pricingStatus;
  List<Product> get items => _items ?? [];
  String? get id => _id;
  String? get supplierId => _supplierId;
  num? get purchaseOrderDate => _purchaseOrderDate;
  num? get expectedOn => _expectedOn;
  String? get service => _service;
  String get notes => _notes ?? "";
  String? get partiationNo => _partiationNo;
  List<num>? get additionalCost => _additionalCost;
  String get pOrder => _pOrder ?? "";
  String? get orderedById => _orderedById;
  String get orderedByName => _orderedByName ?? "";
  String? get organization => _organization;
  String get supplierName => _supplierName ?? "";
  String get serviceName => _serviceName ?? "";
  num? get total => _total;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get refund => _refund;
  bool? get sendMessageToSupplier => _sendMessageToSupplier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_service_changable'] = _isServiceChangable;
    map['type'] = _type;
    map['status'] = _status;
    map['received'] = _received;
    map['total_currency'] = _totalCurrency;
    map['total_count'] = _totalCount;
    map['pricing_status'] = _pricingStatus;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    map['supplier_id'] = _supplierId;
    map['purchase_order_date'] = _purchaseOrderDate;
    map['expected_on'] = _expectedOn;
    map['service'] = _service;
    map['notes'] = _notes;
    map['partiation_no'] = _partiationNo;
    map['additional_cost'] = _additionalCost;
    map['p_order'] = _pOrder;
    map['ordered_by_id'] = _orderedById;
    map['ordered_by_name'] = _orderedByName;
    map['organization'] = _organization;
    map['supplier_name'] = _supplierName;
    map['service_name'] = _serviceName;
    map['total'] = _total;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['refund'] = _refund;
    map['send_message_to_supplier'] = _sendMessageToSupplier;
    return map;
  }

  Map<String, dynamic> toCreate() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['status'] = _status;
    map['total_currency'] = "uzs";
    map['pricing_status'] = _pricingStatus;
    if (_items != null) {
      map['items'] = _items?.map((v) => {
        'product_id': v.id,
        'quantity': v.measurementValues?.shopId?.amount ?? 0,
      }).toList();
    }
    map['supplier_id'] = _supplierId;
    map['purchase_order_date'] = _purchaseOrderDate;
    map['expected_on'] = _expectedOn;
    map['service'] = _service;
    map['notes'] = _notes;
    map['partiation_no'] = _partiationNo;
    map['additional_cost'] = _additionalCost;
    map['refund'] = _refund;
    map['send_message_to_supplier'] = _sendMessageToSupplier;
    return map;
  }

  num countTotalPrice() {
    num totalPrice = 0;
    for (Product item in (_items ?? [])) {
      totalPrice += item.measurementValues?.shopId?.amount ?? 0;
    }
    return totalPrice;
  }
}
