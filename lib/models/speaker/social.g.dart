// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

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
