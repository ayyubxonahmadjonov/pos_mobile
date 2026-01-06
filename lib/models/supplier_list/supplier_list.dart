class SupplierList {
  bool? isDeleted;
  num? balance;
  num? balanceUsd;
  String? balanceCurrency;
  bool? telegramAcces;
  String? sId;
  String? organization;
  String? supplierName;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  SupplierList({
    this.isDeleted,
    this.balance,
    this.balanceUsd,
    this.balanceCurrency,
    this.telegramAcces,
    this.sId,
    this.organization,
    this.supplierName,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  SupplierList.fromJson(Map<String, dynamic> json) {
    isDeleted = json['is_deleted'];
    balance = json['balance'];
    balanceUsd = json['balance_usd'];
    balanceCurrency = json['balance_currency'];
    telegramAcces = json['telegram_acces'];
    sId = json['_id'];
    organization = json['organization'];
    supplierName = json['supplier_name'];
    phoneNumber = json['phone_number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['is_deleted'] = isDeleted;
    data['balance'] = balance;
    data['balance_usd'] = balanceUsd;
    data['balance_currency'] = balanceCurrency;
    data['telegram_acces'] = telegramAcces;
    data['_id'] = sId;
    data['organization'] = organization;
    data['supplier_name'] = supplierName;
    data['phone_number'] = phoneNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return "$supplierName";
  }
}
