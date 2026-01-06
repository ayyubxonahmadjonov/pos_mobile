/*
    Created by: Bakhromjon Polat
    Created on: Dec 28 2022 15:07:46

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:pos_mobile/core/constants/pref_keys.dart';
import 'package:pos_mobile/hive_helper/hive_helper.dart';
import 'package:pos_mobile/models/models.dart';
import 'package:pos_mobile/models/only_product.dart';
import 'package:pos_mobile/models/order/order_model.dart';
import 'package:pos_mobile/models/product_create_request.dart';
import 'package:pos_mobile/models/product_edit_request.dart';
import 'package:pos_mobile/models/products.dart';
import 'package:pos_mobile/product_status.dart';
import 'package:pos_mobile/services/api_service.dart';
import 'package:pos_mobile/services/headers.dart';
import 'package:pos_mobile/services/http_result.dart';
import 'package:pos_mobile/sort_by.dart';

import '../models/purchase/purchase_model.dart';

class ApiRequests extends ApiService {
  ApiRequests._();
  static final ApiRequests instance = ApiRequests._();
  final ApiHeaders _headers = ApiHeaders.instance;
  Future<HttpResult> login({required String phone, required String password}) async {
    String path = '/auth/login_by_web_new';
    return await post(
      path,
      body: {'phone_number': phone, 'password': password},
      headers: _headers.general,
    );
  }

  Future<HttpResult> getItems({
    dynamic limit,
  }) async {
    String organization = AppPrefs.instance.employee.organization.toString();
    String service = AppPrefs.instance.employeeService?.service ?? '';
    String path = '/iventory/items/$organization/$service';
    final body = {'limit': limit, "page": 1};
    return await post(path, body: body, headers: _headers.withTokenV2());
  }

  Future<HttpResult> getOnlineItems(
    final String id,
  ) async {
    String path = '/goods/sales/get/$id';

    return await get(path, headers: _headers.withToken());
  }

  Future<HttpResult> getEmployees({
    dynamic limit,
  }) async {
    String path = '/employees/find?by_whom=csharp';
    HttpResult result = await get(
      path,
      headers: _headers.withToken(),
    );
    if (result.isSuccess) {
      List<Employee> employees =
          (result.getData() as List).map((e) => Employee.fromJson(e)).toList();
      EmployeeHelper.putAll(employees);
    }
    return result;
  }

  Future<HttpResult> getPurchaseList({
    int page = 1,
    String search = "",
    int limit = 20,
  }) async {
    String path = '/inventory/get_purchase_order/$limit/$page';
    return await post(path,
        body: {
          'search': search,
          'service': "",
          "status": "",
          'supplier_id': "",
        },
        headers: _headers.withToken());
  }

  Future<HttpResult> creatPurchase(Purchase body) async {
    String path = '/inventory/create_purchase_order';
    return await post(path,
        body: body.toCreate(), headers: _headers.withToken());
  }

//update Purchase
  Future<HttpResult> updatePurchase(Purchase body, String purchaseId) async {
    String path = '/invenory/purchase/edit/$purchaseId';
    return await post(path, body: body.toJson(), headers: _headers.withToken());
  }

  // Future<HttpResult> receivePurchase({
  //   required String purchaseId,
  //   required List<Product> items,
  // }) async {
  //   String path = '/inventory/purchase/receive/$purchaseId';
  //   var itemsJson = items.map((e) => e.toJson()).toList();
  //   return await post(
  //     path,
  //     body: {"items": itemsJson, "additional_cost": []},
  //     headers: _headers.withToken(),
  //   );
  // }

  // Gets purchase order by id
  Future<HttpResult> getPurchaseOrderById(String id) async {
    String path = '/inventory/get_purchase_order/$id';
    return await get(path, headers: _headers.withToken());
  }

  Future<HttpResult> getSupplier() async {
    String path = '/inventory/get_suppliers';
    return await get(path, headers: _headers.withToken());
  }

  Future<HttpResult> getService() async {
    String path = '/services/get';
    return await get(path, headers: _headers.withToken());
  }

  // Orders

  Future<HttpResult> createOrder(OrderModel order) async {
    const String path = '/employee/order/create';
    return await post(
      path,
      body: order.toApi(),
      headers: _headers.forOrder(),
    );
  }

  Future<HttpResult> getOrders(
    int page, {
    String search = "",
    int limit = 20,
    String service = "",
  }) async {
    const String path = '/api/v1/supplier_order';

    Map<String, dynamic> body = {
      'page': page,
      'limit': limit,
      'service': service,
      "search": search,
    };

    return await post(
      path,
      body: body,
      headers: _headers.withTokenV2(),
    );
  }

   Future<Products?> fetchProducts(int page, String search, int limit,
      SortBy sortBy, ProductsStatus status) async {
    String shopId = prefs.getString(PrefKeys.shopId,);
 
    final data = await post(
headers: _headers.withTokenV2(),
        '/api/v1/products?active_for_sale=${status.name}&limit=$limit&page=$page&search=$search&shop_ids=$shopId&sort_by=${sortBy == SortBy.empty ? '' : sortBy.name}');
   
   print(data.statusCode);
   print(data.response);

    if (data.isSuccess) {
      return Products.fromJson(data.response);
    }

    return null;
  }

 Future<bool> editProduct({
  required String productId,
  required OnlyProduct product,
  required String shopId,
  required num newAmount,
}) async {
  final List<String> categoryIds = [];
  if (product.categories != null) {
    for (final c in product.categories!) {
      if (c.id != null) {
        categoryIds.add(c.id!);
      }
    }
  }

  /// 2️⃣ CUSTOM FIELDS
  final List<CustomFields> customFields = [];
  if (product.customFields != null) {
    for (final f in product.customFields!) {
      customFields.add(
        CustomFields(
          value: f.value,
          customField: f.customField,
          customFieldName: f.customFieldName,
          customFieldType: f.customFieldType,
        ),
      );
    }
  }

  /// 3️⃣ IMAGES
  final List<Images> images = [];
  if (product.images != null) {
    for (final img in product.images!) {
      images.add(
        Images(
          imageUrl:
              img.imageUrl?.replaceAll('https://cdn.7i.uz/file/', '') ?? '',
          sequenceNumber: img.sequenceNumber,
        ),
      );
    }
  }

final List<MeasurementValuesForEdit> measurementValues = [];

if (product.measurementValues != null) {
  for (final m in product.measurementValues!) {
    // /// ❗ Agar shopId mos kelsa, oldStock + addedStock
    // final amountToSend =
    //     m.shopId == shopId ? newAmount : newAmount ?? 0;

    measurementValues.add(
      MeasurementValuesForEdit(
        shopId: m.shopId,
        shopName: m.shopName,
        smallLeft: m.smallLeft,
        hasTrigger: m.hasTrigger,
        isAvailable: m.isAvailable,
        amount: newAmount,
      ),
    );
  }
}

  /// 5️⃣ SHOP PRICES (O‘ZGARMAYDI)
  final List<ShopPricesForEdit> shopPrices = [];
  if (product.shopPrices != null) {
    for (final p in product.shopPrices!) {
      shopPrices.add(
        ShopPricesForEdit(
          shopId: p.shopId,
          shopName: p.shopName,
          supplyPrice: p.supplyPrice,
          retailPrice: p.retailPrice,
          lastSupplyPrice: p.lastSupplyPrice,
          shopPriceTiers: p.shopPriceTiers,
        ),
      );
    }
  }

  /// 6️⃣ REQUEST
  final ProductEditRequest request = ProductEditRequest(
    barcode: product.barcode,
    categoryIds: categoryIds,
    customFields: customFields,
    description: product.description,
    images: images,
    isActive: product.isActive,
    isMarking: product.isMarking,
    measurementUnitId: product.measurementUnit?.id ?? '',
    measurementValues: measurementValues,
    mxikCode: product.mxikCode,
    name: product.name,
    noLoyalty: product.noLoyalty,
    ownerType: product.ownerType,
    packageCode: product.packageCode,
    packageName: product.packageName,
    packageType: product.packageType,
    parentId: product.parentId,
    productTypeId: product.productTypeId,
    serialNumber: product.serialNumber,
    shopPrices: shopPrices,
    sku: product.sku,
    supplierId: product.supplier?.id ?? '',
    vatId: product.vat?.id ?? '',
  );

  final data = await put("/api/v1/product/$productId", body: request.toJson(),headers: _headers.withTokenV2());
  

  return data.isSuccess;
}

}
