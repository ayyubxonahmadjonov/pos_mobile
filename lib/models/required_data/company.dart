/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 1/14/2025, 11:18 AM
*/

class Company {
  String? id;
  String? name;
  String? legalName;
  String? email;
  String? legalAddress;
  String? country;
  String? zipCode;
  String? taxPayerId;
  Owner? owner;
  dynamic size;
  Owner? createdBy;
  dynamic sizeId;
  String? createdAt;
  String? ibt;
  bool? autoGenerate;

  Company(
      {this.id,
      this.name,
      this.legalName,
      this.email,
      this.legalAddress,
      this.country,
      this.zipCode,
      this.taxPayerId,
      this.owner,
      this.size,
      this.createdBy,
      this.sizeId,
      this.createdAt,
      this.ibt,
      this.autoGenerate});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    legalName = json['legal_name'];
    email = json['email'];
    legalAddress = json['legal_address'];
    country = json['country'];
    zipCode = json['zip_code'];
    taxPayerId = json['tax_payer_id'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    size = json['size'];
    createdBy = json['created_by'] != null
        ? Owner.fromJson(json['created_by'])
        : null;
    sizeId = json['size_id'];
    createdAt = json['created_at'];
    ibt = json['ibt'];
    autoGenerate = json['auto_generate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['legal_name'] = legalName;
    data['email'] = email;
    data['legal_address'] = legalAddress;
    data['country'] = country;
    data['zip_code'] = zipCode;
    data['tax_payer_id'] = taxPayerId;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['size'] = size;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    data['size_id'] = sizeId;
    data['created_at'] = createdAt;
    data['ibt'] = ibt;
    data['auto_generate'] = autoGenerate;
    return data;
  }
}

class Owner {
  String? id;
  String? firstName;
  String? lastName;
  String? image;
  String? color;
  String? phoneNumber;
  String? passCode;

  Owner(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.color,
      this.phoneNumber,
      this.passCode});

  Owner.fromJson(Map<String, dynamic> json) {
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
