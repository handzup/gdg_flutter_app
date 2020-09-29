// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schelude_helper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scheludehelper _$ScheludehelperFromJson(Map<String, dynamic> json) {
  return Scheludehelper(
    schelude: json['schelude'] == null
        ? null
        : ScheludeInfo.fromJson(json['schelude'] as Map<String, dynamic>),
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$ScheludehelperToJson(Scheludehelper instance) =>
    <String, dynamic>{
      'schelude': instance.schelude,
      'date': instance.date,
    };
