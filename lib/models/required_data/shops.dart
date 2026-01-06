/*
    @author Suxrob Sattorov, 1/14/2025, 11:20 AM
*/

class Shops {
  List<_Shop>? data;
  String? total;

  Shops({this.data, this.total});

  Shops.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <_Shop>[];
      json['data'].forEach((v) {
        data!.add(_Shop.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class _Shop {
  String? id;
  String? title;
  String? phoneNumber;
  int? size;
  int? numberOfCashbox;
  String? address;
  String? description;
  String? createdAt;
  CreatedBy? createdBy;

  _Shop();

  _Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    phoneNumber = json['phone_number'];
    size = json['size'];
    numberOfCashbox = json['number_of_cashbox'];
    address = json['address'];
    description = json['description'];
    createdAt = json['created_at'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['phone_number'] = phoneNumber;
    data['size'] = size;
    data['number_of_cashbox'] = numberOfCashbox;
    data['address'] = address;
    data['description'] = description;
    data['created_at'] = createdAt;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    return data;
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;
  String? image;
  String? color;
  String? phoneNumber;
  String? passCode;

  CreatedBy(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.color,
      this.phoneNumber,
      this.passCode});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    color = json['color'];
    phoneNumber = json['phone_number'];
    passCode = json['pass_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['color'] = color;
    data['phone_number'] = phoneNumber;
    data['pass_code'] = passCode;
    return data;
  }
}
