// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schelude.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schelude _$ScheludeFromJson(Map<String, dynamic> json) {
  return Schelude(
    tracks: (json['tracks'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dateReadable: json['dateReadable'] as String,
    timeslots: (json['timeslots'] as List)
        ?.map((e) =>
            e == null ? null : Timeslots.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ScheludeToJson(Schelude instance) => <String, dynamic>{
      'dateReadable': instance.dateReadable,
      'timeslots': instance.timeslots,
      'tracks': instance.tracks,
    };
