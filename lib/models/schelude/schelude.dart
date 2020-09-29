import 'package:json_annotation/json_annotation.dart';

import 'timeslots.dart';
import 'track.dart';

part 'schelude.g.dart';

@JsonSerializable()
class Schelude {
  final String dateReadable;
  final List<Timeslots> timeslots;
  final List<Track> tracks;

  Schelude({this.tracks, this.dateReadable, this.timeslots});

  factory Schelude.fromJson(Map<String, dynamic> json) =>
      _$ScheludeFromJson(json);

  Map<String, dynamic> toJson() => _$ScheludeToJson(this);
}
