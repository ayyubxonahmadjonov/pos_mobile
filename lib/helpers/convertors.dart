import 'package:pos_mobile/models/item_model.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/models/shop_prices.dart';

import '../models/product/product_model.dart';

Product productFromItem(ItemModel item) {
  return Product(
    id: item.id,
    sku: item.sku,
    name: item.name,
    image: '',
    isMarking: item.isMarking,
    isActive: item.isActive,
    mxikCode: item.mxikCode,
    parentId: item.parentId,
    companyId: item.companyId,
    description: item.description,
    productTypeId: item.productTypeId,
    shopPrices: item.shopPrices != null
        ? ShopPricesSub.fromJson(item.shopPrices!.toJson())
        : null,
    measurementUnit: item.measurementUnit,
    vat: item.vat,
    barcode: item.barcode,
    ownerType: item.ownerType,
  );
}
