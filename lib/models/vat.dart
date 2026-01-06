/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 7/28/2025, 10:51 AM
*/

class Vat {
  String? id;
  bool? isDefault;
  String? name;
  num? percentage;

  Vat({this.id, this.isDefault, this.name, this.percentage});

  Vat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDefault = json['is_default'];
    name = json['name'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_default'] = isDefault;
    data['name'] = name;
    data['percentage'] = percentage;
    return data;
  }
}
