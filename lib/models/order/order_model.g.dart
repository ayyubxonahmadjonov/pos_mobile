// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 6;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel()
      .._note = fields[0] as String?
      .._sId = fields[1] as String?
      .._organizationId = fields[2] as String?
      .._serviceId = fields[3] as String?
      .._employeeId = fields[4] as String?
      .._date = fields[5] as int?
      .._sectorName = fields[6] as String?
      .._requiredDate = fields[7] as int?
      .._acceptDate = fields[8] as int?
      .._itemsCount = fields[9] as int?
      .._acceptItemsCount = fields[10] as int?
      .._acceptById = fields[11] as String?
      .._acceptByName = fields[12] as String?
      .._items = (fields[13] as List?)?.cast<OrderItem>()
      .._organizationName = fields[14] as String?
      .._serviceName = fields[15] as String?
      .._status = fields[16] as String?
      .._employeeName = fields[17] as String?
      .._pOrder = fields[18] as String?
      .._createdAt = fields[19] as String?
      .._updatedAt = fields[20] as String?;
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj._note)
      ..writeByte(1)
      ..write(obj._sId)
      ..writeByte(2)
      ..write(obj._organizationId)
      ..writeByte(3)
      ..write(obj._serviceId)
      ..writeByte(4)
      ..write(obj._employeeId)
      ..writeByte(5)
      ..write(obj._date)
      ..writeByte(6)
      ..write(obj._sectorName)
      ..writeByte(7)
      ..write(obj._requiredDate)
      ..writeByte(8)
      ..write(obj._acceptDate)
      ..writeByte(9)
      ..write(obj._itemsCount)
      ..writeByte(10)
      ..write(obj._acceptItemsCount)
      ..writeByte(11)
      ..write(obj._acceptById)
      ..writeByte(12)
      ..write(obj._acceptByName)
      ..writeByte(13)
      ..write(obj._items)
      ..writeByte(14)
      ..write(obj._organizationName)
      ..writeByte(15)
      ..write(obj._serviceName)
      ..writeByte(16)
      ..write(obj._status)
      ..writeByte(17)
      ..write(obj._employeeName)
      ..writeByte(18)
      ..write(obj._pOrder)
      ..writeByte(19)
      ..write(obj._createdAt)
      ..writeByte(20)
      ..write(obj._updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderItemAdapter extends TypeAdapter<OrderItem> {
  @override
  final int typeId = 7;

  @override
  OrderItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItem()
      .._productId = fields[0] as String?
      .._productName = fields[1] as String?
      .._productSku = fields[2] as num?
      .._sectorName = fields[3] as String?
      .._date = fields[4] as int?
      .._inStock = fields[5] as num?
      .._realStock = fields[6] as num?
      .._barcode = (fields[7] as List?)?.cast<String>()
      .._orderQuantity = fields[8] as num?
      .._note = fields[9] as String?
      .._isAccept = fields[10] as bool?;
  }

  @override
  void write(BinaryWriter writer, OrderItem obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj._productId)
      ..writeByte(1)
      ..write(obj._productName)
      ..writeByte(2)
      ..write(obj._productSku)
      ..writeByte(3)
      ..write(obj._sectorName)
      ..writeByte(4)
      ..write(obj._date)
      ..writeByte(5)
      ..write(obj._inStock)
      ..writeByte(6)
      ..write(obj._realStock)
      ..writeByte(7)
      ..write(obj._barcode)
      ..writeByte(8)
      ..write(obj._orderQuantity)
      ..writeByte(9)
      ..write(obj._note)
      ..writeByte(10)
      ..write(obj._isAccept);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
