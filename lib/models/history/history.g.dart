// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 5;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel()
      .._size = fields[0] as int?
      .._date = fields[1] as int?
      .._counted = fields[2] as int?
      .._uncounted = fields[3] as int?
      .._path = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._size)
      ..writeByte(1)
      ..write(obj._date)
      ..writeByte(2)
      ..write(obj._counted)
      ..writeByte(3)
      ..write(obj._uncounted)
      ..writeByte(4)
      ..write(obj._path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
