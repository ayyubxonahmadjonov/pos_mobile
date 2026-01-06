// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 8;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as String?,
      sku: fields[1] as String?,
      name: fields[2] as String?,
      isMarking: fields[3] as bool?,
      isActive: fields[4] as bool?,
      mxikCode: fields[5] as String?,
      parentId: fields[6] as String?,
      companyId: fields[7] as String?,
      description: fields[8] as String?,
      productTypeId: fields[9] as String?,
      shopPrices: fields[10] as ShopPrices?,
      measurementUnit: fields[11] as MeasurementUnit?,
      vat: fields[12] as Vat?,
      ownerType: fields[13] as String?,
      barcode: (fields[14] as List?)?.cast<String>(),
      boxBarcode: fields[15] as String?,
      boxBarcodeQuantity: fields[16] as num?,
      hasBoxBarcode: fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sku)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isMarking)
      ..writeByte(4)
      ..write(obj.isActive)
      ..writeByte(5)
      ..write(obj.mxikCode)
      ..writeByte(6)
      ..write(obj.parentId)
      ..writeByte(7)
      ..write(obj.companyId)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.productTypeId)
      ..writeByte(10)
      ..write(obj.shopPrices)
      ..writeByte(11)
      ..write(obj.measurementUnit)
      ..writeByte(12)
      ..write(obj.vat)
      ..writeByte(13)
      ..write(obj.ownerType)
      ..writeByte(14)
      ..write(obj.barcode)
      ..writeByte(15)
      ..write(obj.boxBarcode)
      ..writeByte(16)
      ..write(obj.boxBarcodeQuantity)
      ..writeByte(17)
      ..write(obj.hasBoxBarcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
