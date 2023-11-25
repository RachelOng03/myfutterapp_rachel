// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseBoxRezepte.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class databaseBoxRezepteAdapter extends TypeAdapter<databaseBoxRezepte> {
  @override
  final int typeId = 5;

  @override
  databaseBoxRezepte read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return databaseBoxRezepte(
      rezepte_id: fields[0] as int,
      rezepte_titel: fields[1] as int,
      rezepte_zeit: fields[2] as int,
      rezepte_kurzbeschreibung: fields[3] as int,
      rezepte_anleitung: fields[4] as int,
      rezepte_art: fields[5] as int,
      rezepte_bild: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, databaseBoxRezepte obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.rezepte_id)
      ..writeByte(1)
      ..write(obj.rezepte_titel)
      ..writeByte(2)
      ..write(obj.rezepte_zeit)
      ..writeByte(3)
      ..write(obj.rezepte_kurzbeschreibung)
      ..writeByte(4)
      ..write(obj.rezepte_anleitung)
      ..writeByte(5)
      ..write(obj.rezepte_art)
      ..writeByte(6)
      ..write(obj.rezepte_bild);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is databaseBoxRezepteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
