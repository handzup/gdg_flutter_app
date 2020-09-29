// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeslots _$TimeslotsFromJson(Map<String, dynamic> json) {
  return Timeslots(
    startTime: json['startTime'] as String,
    endTime: json['endTime'] as String,
    sessions: (json['sessions'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TimeslotsToJson(Timeslots instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'sessions': instance.sessions,
    };
