/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 1/14/2025, 11:20 AM
*/

class UserShops {
  List<MainShop>? data;
  String? total;

  UserShops({this.data, this.total});

  UserShops.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MainShop>[];
      json['data'].forEach((v) {
        data!.add(MainShop.fromJson(v));
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

class MainShop {
  String? id;
  String? title;
  String? phoneNumber;
  int? size;
  int? numberOfCashbox;
  String? address;
  String? description;
  String? createdAt;
  dynamic createdBy;

  MainShop(
      {this.id,
      this.title,
      this.phoneNumber,
      this.size,
      this.numberOfCashbox,
      this.address,
      this.description,
      this.createdAt,
      this.createdBy});

  MainShop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    phoneNumber = json['phone_number'];
    size = json['size'];
    numberOfCashbox = json['number_of_cashbox'];
    address = json['address'];
    description = json['description'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
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
    data['created_by'] = createdBy;
    return data;
  }
}
