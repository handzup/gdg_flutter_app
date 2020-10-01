// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Speaker.fromJson(e as Map<String, dynamic>, ''))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'mebers': instance.members,
      'title': instance.title,
    };
