// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 0;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee()
      .._uiLanguage = fields[0] as UiLanguage?
      .._isBoss = fields[1] as bool?
      .._service = fields[2] as String?
      .._isActive = fields[3] as bool?
      .._percentage = fields[4] as int?
      .._isPassword = fields[5] as bool?
      .._password = fields[6] as String?
      .._role = fields[23] as String?
      .._fullName = fields[7] as String?
      .._name = fields[8] as String?
      .._email = fields[9] as String?
      .._lastName = fields[10] as String?
      .._isPhoneNumber = fields[11] as bool?
      .._token = fields[12] as String?
      .._fireToken = fields[13] as String?
      .._imageUrl = fields[14] as String?
      .._id = fields[15] as String?
      .._services = (fields[16] as List?)?.cast<EmployeeService>()
      .._phoneNumber = fields[17] as String?
      .._organization = fields[18] as String?
      .._createdAt = fields[19] as String?
      .._updatedAt = fields[20] as String?
      .._v = fields[21] as int?
      .._access = fields[22] as AccessModel?;
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj._uiLanguage)
      ..writeByte(1)
      ..write(obj._isBoss)
      ..writeByte(2)
      ..write(obj._service)
      ..writeByte(3)
      ..write(obj._isActive)
      ..writeByte(4)
      ..write(obj._percentage)
      ..writeByte(5)
      ..write(obj._isPassword)
      ..writeByte(6)
      ..write(obj._password)
      ..writeByte(23)
      ..write(obj._role)
      ..writeByte(7)
      ..write(obj._fullName)
      ..writeByte(8)
      ..write(obj._name)
      ..writeByte(9)
      ..write(obj._email)
      ..writeByte(10)
      ..write(obj._lastName)
      ..writeByte(11)
      ..write(obj._isPhoneNumber)
      ..writeByte(12)
      ..write(obj._token)
      ..writeByte(13)
      ..write(obj._fireToken)
      ..writeByte(14)
      ..write(obj._imageUrl)
      ..writeByte(15)
      ..write(obj._id)
      ..writeByte(16)
      ..write(obj._services)
      ..writeByte(17)
      ..write(obj._phoneNumber)
      ..writeByte(18)
      ..write(obj._organization)
      ..writeByte(19)
      ..write(obj._createdAt)
      ..writeByte(20)
      ..write(obj._updatedAt)
      ..writeByte(21)
      ..write(obj._v)
      ..writeByte(22)
      ..write(obj._access);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
