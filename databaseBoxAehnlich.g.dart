// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseBoxAehnlich.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class databaseBoxAehnlichAdapter extends TypeAdapter<databaseBoxAehnlich> {
  @override
  final int typeId = 6;

  @override
  databaseBoxAehnlich read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return databaseBoxAehnlich(
      aehnlich_id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, databaseBoxAehnlich obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.aehnlich_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is databaseBoxAehnlichAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
