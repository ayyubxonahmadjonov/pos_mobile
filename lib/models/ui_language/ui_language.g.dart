// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UiLanguageAdapter extends TypeAdapter<UiLanguage> {
  @override
  final int typeId = 1;

  @override
  UiLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UiLanguage()
      .._text = fields[0] as String?
      .._value = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, UiLanguage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._text)
      ..writeByte(1)
      ..write(obj._value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
