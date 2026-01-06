// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeServiceAdapter extends TypeAdapter<EmployeeService> {
  @override
  final int typeId = 2;

  @override
  EmployeeService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeService()
      .._available = fields[0] as bool?
      .._id = fields[1] as String?
      .._service = fields[2] as String?
      .._serviceName = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, EmployeeService obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._available)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._service)
      ..writeByte(3)
      ..write(obj._serviceName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
