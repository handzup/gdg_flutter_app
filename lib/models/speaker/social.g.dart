// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SocialAdapter extends TypeAdapter<Social> {
  @override
  final int typeId = 2;

  @override
  Social read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Social(
      icon: fields[0] as String,
      link: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Social obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.icon)
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
      other is SocialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Social _$SocialFromJson(Map<String, dynamic> json) {
  return Social(
    icon: json['icon'] as String,
    link: json['link'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'icon': instance.icon,
      'link': instance.link,
      'name': instance.name,
    };
