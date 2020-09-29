import 'package:json_annotation/json_annotation.dart';

import 'timeslots.dart';
import 'track.dart';

part 'schelude_info.g.dart';

@JsonSerializable()
class ScheludeInfo {
  final String dateReadable;
  final List<Timeslots> timeslots;
  final List<Track> tracks;

  ScheludeInfo({this.tracks, this.dateReadable, this.timeslots});

  factory ScheludeInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheludeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ScheludeInfoToJson(this);
}
