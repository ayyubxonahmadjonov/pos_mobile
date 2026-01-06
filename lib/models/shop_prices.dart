/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 7/28/2025, 10:52 AM
*/

class ShopPrices {
  num? lastSupplyPrice;
  num? retailPrice;
  String? shopId;
  String? shopName;
  num? supplyPrice;
  List<ShopPriceTiers>? shopPriceTiers;

  ShopPrices({
    this.lastSupplyPrice,
    this.retailPrice,
    this.shopId,
    this.shopName,
    this.supplyPrice,
    this.shopPriceTiers,
  });

  ShopPrices.fromJson(Map<String, dynamic> json) {
    lastSupplyPrice = json['last_supply_price'];
    retailPrice = json['retail_price'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    supplyPrice = json['supply_price'];
    if (json['shop_price_tiers'] != null) {
      shopPriceTiers = <ShopPriceTiers>[];
      json['shop_price_tiers'].forEach((v) {
        shopPriceTiers!.add(ShopPriceTiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_supply_price'] = lastSupplyPrice;
    data['retail_price'] = retailPrice;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['supply_price'] = supplyPrice;
    if (shopPriceTiers != null) {
      data['shop_price_tiers'] =
          shopPriceTiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopPriceTiers {
  int? minQuantity;
  num? retailPrice;

  ShopPriceTiers({this.minQuantity, this.retailPrice});

  ShopPriceTiers.fromJson(Map<String, dynamic> json) {
    minQuantity = json['min_quantity'];
    retailPrice = json['retail_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_quantity'] = minQuantity;
    data['retail_price'] = retailPrice;
    return data;
  }
}
