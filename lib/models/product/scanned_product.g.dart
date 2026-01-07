// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScannedProductAdapter extends TypeAdapter<ScannedProduct> {
  @override
  final int typeId = 11;

  @override
  ScannedProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannedProduct(
      id: fields[0] as String?,
      sku: fields[1] as String?,
      name: fields[2] as String?,
      image: fields[3] as String?,
      isMarking: fields[4] as bool?,
      isActive: fields[5] as bool?,
      mxikCode: fields[6] as String?,
      parentId: fields[7] as String?,
      companyId: fields[8] as String?,
      createdAt: fields[9] as String?,
      description: fields[10] as String?,
      productTypeId: fields[11] as String?,
      barcode: (fields[12] as List?)?.cast<String>(),
      updatedAt: fields[13] as num?,
      lastUpdatedTime: fields[17] as String?,
      serialNumber: fields[18] as bool?,
      ownerType: fields[19] as String?,
    )
      .._shopPricesJson = fields[20] as String?
      .._categoriesJson = fields[21] as String?
      .._measurementUnitJson = fields[22] as String?
      .._vatJson = fields[23] as String?
      .._measurementValuesJson = fields[24] as String?
      .._createdByJson = fields[25] as String?
      .._realStock = fields[26] as num
      .._isScanned = fields[27] as bool
      .._amount = fields[28] as num?
      .._cost = fields[29] as num?
      .._purchaseCost = fields[30] as num?
      .._quantity = fields[31] as num?
      .._toReceive = fields[32] as num?
      .._received = fields[33] as num?
      .._defaultCost = fields[34] as num?
      .._productName = fields[35] as String?
      .._primarySupplierId = fields[36] as String?
      .._primarySupplierName = fields[37] as String?
      .._servicesJson = fields[38] as String?
      ..originalAmount = fields[39] as num?
      ..updateAmount = fields[40] as num?
      ..isScannedProduct = fields[41] as bool?;
  }

  @override
  void write(BinaryWriter writer, ScannedProduct obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sku)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.isMarking)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.mxikCode)
      ..writeByte(7)
      ..write(obj.parentId)
      ..writeByte(8)
      ..write(obj.companyId)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.productTypeId)
      ..writeByte(12)
      ..write(obj.barcode)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.lastUpdatedTime)
      ..writeByte(18)
      ..write(obj.serialNumber)
      ..writeByte(19)
      ..write(obj.ownerType)
      ..writeByte(20)
      ..write(obj._shopPricesJson)
      ..writeByte(21)
      ..write(obj._categoriesJson)
      ..writeByte(22)
      ..write(obj._measurementUnitJson)
      ..writeByte(23)
      ..write(obj._vatJson)
      ..writeByte(24)
      ..write(obj._measurementValuesJson)
      ..writeByte(25)
      ..write(obj._createdByJson)
      ..writeByte(26)
      ..write(obj._realStock)
      ..writeByte(27)
      ..write(obj._isScanned)
      ..writeByte(28)
      ..write(obj._amount)
      ..writeByte(29)
      ..write(obj._cost)
      ..writeByte(30)
      ..write(obj._purchaseCost)
      ..writeByte(31)
      ..write(obj._quantity)
      ..writeByte(32)
      ..write(obj._toReceive)
      ..writeByte(33)
      ..write(obj._received)
      ..writeByte(34)
      ..write(obj._defaultCost)
      ..writeByte(35)
      ..write(obj._productName)
      ..writeByte(36)
      ..write(obj._primarySupplierId)
      ..writeByte(37)
      ..write(obj._primarySupplierName)
      ..writeByte(38)
      ..write(obj._servicesJson)
      ..writeByte(39)
      ..write(obj.originalAmount)
      ..writeByte(40)
      ..write(obj.updateAmount)
      ..writeByte(41)
      ..write(obj.isScannedProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannedProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
