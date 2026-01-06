// ignore_for_file: unnecessary_getters_setters

/*

  Created by: Bakhromjon Polat
  Created on: Mar 02 2023 16:48:38
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

class ProductService {
  int? _price;
  bool? _isPriceChange;
  String? _priceCurrency;
  bool? _priceAutoFill;
  List<Prices>? _prices;
  num? _inStock;
  int? _reminder;
  String? _variantName;
  bool? _stoppedItem;
  int? _printedTime;
  int? _printedPriceChangeTime;
  int? _lastPriceChange;
  String? _sId;
  bool? _available;
  int? _lowStock;
  int? _optimalStock;
  String? _service;
  String? _serviceName;

  ProductService({
    int? price,
    bool? isPriceChange,
    String? priceCurrency,
    bool? priceAutoFill,
    List<Prices>? prices,
    int? inStock,
    int? reminder,
    String? variantName,
    bool? stoppedItem,
    int? printedTime,
    int? printedPriceChangeTime,
    int? lastPriceChange,
    String? sId,
    bool? available,
    int? lowStock,
    int? optimalStock,
    String? service,
    String? serviceName,
  }) {
    if (price != null) {
      _price = price;
    }
    if (isPriceChange != null) {
      _isPriceChange = isPriceChange;
    }
    if (priceCurrency != null) {
      _priceCurrency = priceCurrency;
    }
    if (priceAutoFill != null) {
      _priceAutoFill = priceAutoFill;
    }
    if (prices != null) {
      _prices = prices;
    }
    if (inStock != null) {
      _inStock = inStock;
    }
    if (reminder != null) {
      _reminder = reminder;
    }
    if (variantName != null) {
      _variantName = variantName;
    }
    if (stoppedItem != null) {
      _stoppedItem = stoppedItem;
    }
    if (printedTime != null) {
      _printedTime = printedTime;
    }
    if (printedPriceChangeTime != null) {
      _printedPriceChangeTime = printedPriceChangeTime;
    }
    if (lastPriceChange != null) {
      _lastPriceChange = lastPriceChange;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (available != null) {
      _available = available;
    }
    if (lowStock != null) {
      _lowStock = lowStock;
    }
    if (optimalStock != null) {
      _optimalStock = optimalStock;
    }
    if (service != null) {
      _service = service;
    }
    if (serviceName != null) {
      _serviceName = serviceName;
    }
  }

  int? get price => _price;
  set price(int? price) => _price = price;
  bool? get isPriceChange => _isPriceChange;
  set isPriceChange(bool? isPriceChange) => _isPriceChange = isPriceChange;
  String? get priceCurrency => _priceCurrency;
  set priceCurrency(String? priceCurrency) => _priceCurrency = priceCurrency;
  bool? get priceAutoFill => _priceAutoFill;
  set priceAutoFill(bool? priceAutoFill) => _priceAutoFill = priceAutoFill;
  List<Prices>? get prices => _prices;
  set prices(List<Prices>? prices) => _prices = prices;
  num? get inStock => _inStock;
  set inStock(num? inStock) => _inStock = inStock;
  int? get reminder => _reminder;
  set reminder(int? reminder) => _reminder = reminder;
  String? get variantName => _variantName;
  set variantName(String? variantName) => _variantName = variantName;
  bool? get stoppedItem => _stoppedItem;
  set stoppedItem(bool? stoppedItem) => _stoppedItem = stoppedItem;
  int? get printedTime => _printedTime;
  set printedTime(int? printedTime) => _printedTime = printedTime;
  int? get printedPriceChangeTime => _printedPriceChangeTime;
  set printedPriceChangeTime(int? printedPriceChangeTime) =>
      _printedPriceChangeTime = printedPriceChangeTime;
  int? get lastPriceChange => _lastPriceChange;
  set lastPriceChange(int? lastPriceChange) =>
      _lastPriceChange = lastPriceChange;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  bool? get available => _available;
  set available(bool? available) => _available = available;
  int? get lowStock => _lowStock;
  set lowStock(int? lowStock) => _lowStock = lowStock;
  int? get optimalStock => _optimalStock;
  set optimalStock(int? optimalStock) => _optimalStock = optimalStock;
  String? get service => _service;
  set service(String? service) => _service = service;
  String? get serviceName => _serviceName;
  set serviceName(String? serviceName) => _serviceName = serviceName;

  ProductService.fromJson(Map<String, dynamic> json) {
    _price = json['price'];
    _isPriceChange = json['is_price_change'];
    _priceCurrency = json['price_currency'];
    _priceAutoFill = json['price_auto_fill'];
    if (json['prices'] != null) {
      _prices = <Prices>[];
      json['prices'].forEach((v) {
        _prices!.add(Prices.fromJson(v));
      });
    }
    _inStock = json['in_stock'];
    _reminder = json['reminder'];
    _variantName = json['variant_name'];
    _stoppedItem = json['stopped_item'];
    _printedTime = json['printed_time'];
    _printedPriceChangeTime = json['printed_price_change_time'];
    _lastPriceChange = json['last_price_change'];
    _sId = json['_id'];
    _available = json['available'];
    _lowStock = json['low_stock'];
    _optimalStock = json['optimal_stock'];
    _service = json['service'];
    _serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = _price;
    data['is_price_change'] = _isPriceChange;
    data['price_currency'] = _priceCurrency;
    data['price_auto_fill'] = _priceAutoFill;
    if (_prices != null) {
      data['prices'] = _prices!.map((v) => v.toJson()).toList();
    }
    data['in_stock'] = _inStock;
    data['reminder'] = _reminder;
    data['variant_name'] = _variantName;
    data['stopped_item'] = _stoppedItem;
    data['printed_time'] = _printedTime;
    data['printed_price_change_time'] = _printedPriceChangeTime;
    data['last_price_change'] = _lastPriceChange;
    data['_id'] = _sId;
    data['available'] = _available;
    data['low_stock'] = _lowStock;
    data['optimal_stock'] = _optimalStock;
    data['service'] = _service;
    data['service_name'] = _serviceName;
    return data;
  }
}

class Prices {
  int? _from;
  int? _price;

  Prices({int? from, int? price}) {
    if (from != null) {
      _from = from;
    }
    if (price != null) {
      _price = price;
    }
  }

  int? get from => _from;
  set from(int? from) => _from = from;
  int? get price => _price;
  set price(int? price) => _price = price;

  Prices.fromJson(Map<String, dynamic> json) {
    _from = json['from'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = _from;
    data['price'] = _price;
    return data;
  }
}
