import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../speaker/speaker.dart';

part 'session.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Session {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String complexity;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String presentation;
  @HiveField(4)
  @JsonKey(fromJson: _fromJson)
  @HiveField(5)
  List<Speaker> speakers;
  @HiveField(6)
  final List<String> tags;
  @HiveField(7)
  final String title;
  @HiveField(0)
  final String videoId;

  Session(
      {this.id,
      this.complexity,
      this.description,
      this.presentation,
      this.speakers,
      this.tags,
      this.title,
      this.videoId});

  factory Session.fromJson(Map<String, dynamic> json, int id) =>
      _$SessionFromJson(json, id);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  static _fromJson(dynamic speaker) {
    if (speaker is Speaker) {
      return speaker;
    } else {
      var list = <Speaker>[];
      if (speaker != null) {
        for (var i = 0; i < speaker.length; i++) {
          list.add(Speaker(queryPath: speaker[i]));
        }
      } else {
        list = null;
      }
      return list;
    }
  }
}
