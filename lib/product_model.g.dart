// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductFromJsonAdapter extends TypeAdapter<ProductFromJson> {
  @override
  final int typeId = 10;

  @override
  ProductFromJson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductFromJson(
      id: fields[0] as String?,
      name: fields[1] as String?,
      sku: fields[2] as String?,
      barcodes: (fields[3] as List?)?.cast<String>(),
      amount: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductFromJson obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sku)
      ..writeByte(3)
      ..write(obj.barcodes)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFromJsonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
