// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BadgeAdapter extends TypeAdapter<Badge> {
  @override
  final int typeId = 3;

  @override
  Badge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Badge(
      description: fields[0] as String,
      link: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Badge obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return Badge(
    description: json['description'] as String,
    link: json['link'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BadgeToJson(Badge instance) => <String, dynamic>{
      'description': instance.description,
      'link': instance.link,
      'name': instance.name,
    };
