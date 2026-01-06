import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 10)
class ProductFromJson extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? sku;

  @HiveField(3)
  List<String>? barcodes;

  @HiveField(4)
  int? amount;

  ProductFromJson({this.id, this.name, this.sku, this.barcodes, this.amount});

  factory ProductFromJson.fromJson(Map<String, dynamic> json) {
    String? barcodeRaw = json['barcode'];
    List<String>? barcodeList;

    if (barcodeRaw != null && barcodeRaw.isNotEmpty) {
      barcodeList = barcodeRaw.split(';').map((e) => e.trim()).toList();
    } else {
      barcodeList = [];
    }

    return ProductFromJson(
      id: json['product_id']?.toString() ?? json['id']?.toString(),
      name: json['name'],
      sku: json['sku']?.toString(),
      barcodes: barcodeList,
      amount: int.tryParse(json['amount(Tiin Optom)']?.toString() ?? '0'),
    );
  }
}
