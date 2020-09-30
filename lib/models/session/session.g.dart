// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<Session> {
  @override
  final int typeId = 1;

  @override
  Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Session(
      id: fields[0] as int,
      complexity: fields[1] as String,
      description: fields[2] as String,
      presentation: fields[3] as String,
      speakers: (fields[4] as List)?.cast<Speaker>(),
      tags: (fields[6] as List)?.cast<String>(),
      title: fields[7] as String,
      videoId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Session obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.complexity)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.presentation)
      ..writeByte(4)
      ..write(obj.speakers)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.videoId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json, int id) {
  return Session(
    id: id ?? json['id'] as int,
    complexity: json['complexity'] as String,
    description: json['description'] as String,
    presentation: json['presentation'] as String,
    speakers: Session._fromJson(json['speakers']),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    title: json['title'] as String,
    videoId: json['videoId'] as String,
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'complexity': instance.complexity,
      'description': instance.description,
      'presentation': instance.presentation,
      'speakers': instance.speakers,
      'tags': instance.tags,
      'title': instance.title,
      'videoId': instance.videoId,
    };
