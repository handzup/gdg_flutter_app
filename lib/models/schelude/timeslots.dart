import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'timeslots.g.dart';

@JsonSerializable()
class Timeslots {
  final String startTime;
  final String endTime;
  final List<Item> sessions;

  Timeslots({this.startTime, this.endTime, this.sessions});

  factory Timeslots.fromJson(Map<String, dynamic> json) =>
      _$TimeslotsFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotsToJson(this);
}
