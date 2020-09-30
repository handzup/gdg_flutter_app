// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json, int id) {
  return Session(
    id: id,
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
      'complexity': instance.complexity,
      'description': instance.description,
      'presentation': instance.presentation,
      'speakers': instance.speakers,
      'tags': instance.tags,
      'title': instance.title,
      'videoId': instance.videoId,
    };
