/*

  Created by: Bakhromjon Polat
  Created on: Feb 23 2023 11:33:02
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

// class Product {
//   String? _id;
//   List<String>? _barcode;
//   num? _sku;
//   String? _productName;
//   num? _received;
//   num? _cancelled;
//   bool? _isCancelled;
//   num? _incoming;
//   num? _toReceive;
//   num? _quality;
//   num? _purchaseCost;
//   String? _purchaseCostCurrency;
//   String? _productId;
//   num? _cost;
//   String? _purchaseId;
//   String? _service;
//   num? _amount;
//   String? _createdAt;
//   String? _updatedAt;
//   num? _price;
//   Product({
//     List<String>? barcode,
//     num? received,
//     num? cancelled,
//     bool? isCancelled,
//     num? incoming,
//     num? toReceive,
//     num? quality,
//     num? purchaseCost,
//     String? purchaseCostCurrency,
//     String? id,
//     String? productId,
//     num? cost,
//     String? productName,
//     num? sku,
//     String? purchaseId,
//     String? service,
//     num? amount,
//     String? createdAt,
//     String? updatedAt,
//     num? price,
//   }) {
//     _barcode = barcode;
//     _received = received;
//     _cancelled = cancelled;
//     _isCancelled = isCancelled;
//     _incoming = incoming;
//     _toReceive = toReceive;
//     _quality = quality;
//     _purchaseCost = purchaseCost;
//     _purchaseCostCurrency = purchaseCostCurrency;
//     _id = id;
//     _productId = productId;
//     _cost = cost;
//     _productName = productName;
//     _sku = sku;
//     _purchaseId = purchaseId;
//     _service = service;
//     _amount = amount;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _price = price;
//   }

//   Product.fromJson(dynamic json) {
//     _barcode = json['barcode'] != null ? json['barcode'].cast<String>() : [];
//     _received = json['received'];
//     _cancelled = json['cancelled'];
//     _isCancelled = json['is_cancelled'];
//     _incoming = json['incoming'];
//     _toReceive = json['to_receive'];
//     _quality = json['quality'];
//     _purchaseCost = json['purchase_cost'];
//     _purchaseCostCurrency = json['purchase_cost_currency'];
//     _id = json['_id'];
//     _productId = json['product_id'];
//     _cost = json['cost'];
//     _productName = json['product_name'];
//     _sku = json['sku'];
//     _purchaseId = json['purchase_id'];
//     _service = json['service'];
//     _amount = json['amount'];
//     _createdAt = json['createdAt'];
//     _updatedAt = json['updatedAt'];
//     _price = json['price'];
//   }

//   Product copyWith({
//     List<String>? barcode,
//     num? received,
//     num? cancelled,
//     bool? isCancelled,
//     num? incoming,
//     num? toReceive,
//     num? quality,
//     num? purchaseCost,
//     String? purchaseCostCurrency,
//     String? id,
//     String? productId,
//     num? cost,
//     String? productName,
//     num? sku,
//     String? purchaseId,
//     String? service,
//     num? amount,
//     num? v,
//     String? createdAt,
//     String? updatedAt,
//     num? price,
//   }) =>
//       Product(
//         barcode: barcode ?? _barcode,
//         received: received ?? _received,
//         cancelled: cancelled ?? _cancelled,
//         isCancelled: isCancelled ?? _isCancelled,
//         incoming: incoming ?? _incoming,
//         toReceive: toReceive ?? _toReceive,
//         quality: quality ?? _quality,
//         purchaseCost: purchaseCost ?? _purchaseCost,
//         purchaseCostCurrency: purchaseCostCurrency ?? _purchaseCostCurrency,
//         id: id ?? _id,
//         productId: productId ?? _productId,
//         cost: cost ?? _cost,
//         productName: productName ?? _productName,
//         sku: sku ?? _sku,
//         purchaseId: purchaseId ?? _purchaseId,
//         service: service ?? _service,
//         amount: amount ?? _amount,
//         createdAt: createdAt ?? _createdAt,
//         updatedAt: updatedAt ?? _updatedAt,
//         price: price ?? _price,
//       );
//   List<String> get barcode => _barcode ?? [];
//   num? get received => _received;
//   num? get cancelled => _cancelled;
//   bool? get isCancelled => _isCancelled;
//   num? get incoming => _incoming;
//   num? get toReceive => _toReceive;
//   num? get quality => _quality;
//   num? get purchaseCost => _purchaseCost;
//   String? get purchaseCostCurrency => _purchaseCostCurrency;
//   String? get id => _id;
//   String? get productId => _productId;
//   num? get cost => _cost;
//   String? get productName => _productName;
//   num? get sku => _sku;
//   String? get purchaseId => _purchaseId;
//   String? get service => _service;
//   num? get amount => _amount;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   num? get price => _price;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['barcode'] = _barcode;
//     map['received'] = _received;
//     map['cancelled'] = _cancelled;
//     map['is_cancelled'] = _isCancelled;
//     map['incoming'] = _incoming;
//     map['to_receive'] = _toReceive;
//     map['quality'] = _quality;
//     map['purchase_cost'] = _purchaseCost;
//     map['purchase_cost_currency'] = _purchaseCostCurrency;
//     map['_id'] = _id;
//     map['product_id'] = _productId;
//     map['cost'] = _cost;
//     map['product_name'] = _productName;
//     map['sku'] = _sku;
//     map['purchase_id'] = _purchaseId;
//     map['service'] = _service;
//     map['amount'] = _amount;
//     map['createdAt'] = _createdAt;
//     map['updatedAt'] = _updatedAt;
//     map['price'] = _price;
//     return map;
//   }
// }
