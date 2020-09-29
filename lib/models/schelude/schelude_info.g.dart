// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schelude_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheludeInfo _$ScheludeInfoFromJson(Map<String, dynamic> json) {
  return ScheludeInfo(
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

Map<String, dynamic> _$ScheludeInfoToJson(ScheludeInfo instance) =>
    <String, dynamic>{
      'dateReadable': instance.dateReadable,
      'timeslots': instance.timeslots,
      'tracks': instance.tracks,
    };
