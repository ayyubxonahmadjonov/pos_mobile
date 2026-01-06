// ignore_for_file: unnecessary_getters_setters

/*

  Created by: Bakhromjon Polat
  Created on: Feb 22 2023 16:22:36
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

class SupplierModel {
  bool? _isDeleted;
  int? _balance;
  int? _balanceUsd;
  String? _balanceCurrency;
  bool? _telegramAcces;
  String? _sId;
  String? _organization;
  String? _supplierName;
  String? _phoneNumber;
  List<SupplierService>? _services;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  SupplierModel({
    bool? isDeleted,
    int? balance,
    int? balanceUsd,
    String? balanceCurrency,
    bool? telegramAcces,
    String? sId,
    String? organization,
    String? supplierName,
    String? phoneNumber,
    List<SupplierService>? services,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) {
    if (isDeleted != null) {
      _isDeleted = isDeleted;
    }
    if (balance != null) {
      _balance = balance;
    }
    if (balanceUsd != null) {
      _balanceUsd = balanceUsd;
    }
    if (balanceCurrency != null) {
      _balanceCurrency = balanceCurrency;
    }
    if (telegramAcces != null) {
      _telegramAcces = telegramAcces;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (organization != null) {
      _organization = organization;
    }
    if (supplierName != null) {
      _supplierName = supplierName;
    }
    if (phoneNumber != null) {
      _phoneNumber = phoneNumber;
    }
    if (services != null) {
      _services = services;
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

  bool? get isDeleted => _isDeleted;
  set isDeleted(bool? isDeleted) => _isDeleted = isDeleted;
  int? get balance => _balance;
  set balance(int? balance) => _balance = balance;
  int? get balanceUsd => _balanceUsd;
  set balanceUsd(int? balanceUsd) => _balanceUsd = balanceUsd;
  String? get balanceCurrency => _balanceCurrency;
  set balanceCurrency(String? balanceCurrency) =>
      _balanceCurrency = balanceCurrency;
  bool? get telegramAcces => _telegramAcces;
  set telegramAcces(bool? telegramAcces) => _telegramAcces = telegramAcces;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get organization => _organization;
  set organization(String? organization) => _organization = organization;
  String? get supplierName => _supplierName;
  set supplierName(String? supplierName) => _supplierName = supplierName;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  List<SupplierService>? get services => _services;
  set services(List<SupplierService>? services) => _services = services;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  SupplierModel.fromJson(Map<String, dynamic> json) {
    _isDeleted = json['is_deleted'];
    _balance = json['balance'];
    _balanceUsd = json['balance_usd'];
    _balanceCurrency = json['balance_currency'];
    _telegramAcces = json['telegram_acces'];
    _sId = json['_id'];
    _organization = json['organization'];
    _supplierName = json['supplier_name'];
    _phoneNumber = json['phone_number'];
    if (json['services'] != null) {
      _services = <SupplierService>[];
      json['services'].forEach((v) {
        _services!.add(SupplierService.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_deleted'] = _isDeleted;
    data['balance'] = _balance;
    data['balance_usd'] = _balanceUsd;
    data['balance_currency'] = _balanceCurrency;
    data['telegram_acces'] = _telegramAcces;
    data['_id'] = _sId;
    data['organization'] = _organization;
    data['supplier_name'] = _supplierName;
    data['phone_number'] = _phoneNumber;
    if (_services != null) {
      data['services'] = _services!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    data['__v'] = _iV;
    return data;
  }
}

class SupplierService {
  int? _balance;
  int? _balanceUsd;
  String? _balanceCurrency;
  bool? _available;
  bool? _telegramAcces;
  String? _sId;
  String? _service;
  String? _serviceName;

  SupplierService({
    int? balance,
    int? balanceUsd,
    String? balanceCurrency,
    bool? available,
    bool? telegramAcces,
    String? sId,
    String? service,
    String? serviceName,
  }) {
    if (balance != null) {
      _balance = balance;
    }
    if (balanceUsd != null) {
      _balanceUsd = balanceUsd;
    }
    if (balanceCurrency != null) {
      _balanceCurrency = balanceCurrency;
    }
    if (available != null) {
      _available = available;
    }
    if (telegramAcces != null) {
      _telegramAcces = telegramAcces;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (service != null) {
      _service = service;
    }
    if (serviceName != null) {
      _serviceName = serviceName;
    }
  }

  int? get balance => _balance;
  set balance(int? balance) => _balance = balance;
  int? get balanceUsd => _balanceUsd;
  set balanceUsd(int? balanceUsd) => _balanceUsd = balanceUsd;
  String? get balanceCurrency => _balanceCurrency;
  set balanceCurrency(String? balanceCurrency) =>
      _balanceCurrency = balanceCurrency;
  bool? get available => _available;
  set available(bool? available) => _available = available;
  bool? get telegramAcces => _telegramAcces;
  set telegramAcces(bool? telegramAcces) => _telegramAcces = telegramAcces;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get service => _service;
  set service(String? service) => _service = service;
  String? get serviceName => _serviceName;
  set serviceName(String? serviceName) => _serviceName = serviceName;

  SupplierService.fromJson(Map<String, dynamic> json) {
    _balance = json['balance'];
    _balanceUsd = json['balance_usd'];
    _balanceCurrency = json['balance_currency'];
    _available = json['available'];
    _telegramAcces = json['telegram_acces'];
    _sId = json['_id'];
    _service = json['service'];
    _serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = _balance;
    data['balance_usd'] = _balanceUsd;
    data['balance_currency'] = _balanceCurrency;
    data['available'] = _available;
    data['telegram_acces'] = _telegramAcces;
    data['_id'] = _sId;
    data['service'] = _service;
    data['service_name'] = _serviceName;
    return data;
  }
}
