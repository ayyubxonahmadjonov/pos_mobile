/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 7/28/2025, 10:50 AM
*/

class MeasurementValues {
  num? amount;
  bool? hasTrigger;
  bool? isAvailable;
  String? shopId;
  String? shopName;
  num? smallLeft;

  MeasurementValues(
      {this.amount,
      this.hasTrigger,
      this.isAvailable,
      this.shopId,
      this.shopName,
      this.smallLeft});

  MeasurementValues.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    hasTrigger = json['has_trigger'];
    isAvailable = json['is_available'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    smallLeft = json['small_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['has_trigger'] = hasTrigger;
    data['is_available'] = isAvailable;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['small_left'] = smallLeft;
    return data;
  }
}
