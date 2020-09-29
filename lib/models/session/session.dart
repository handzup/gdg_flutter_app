import 'package:gdg_flutter_app/models/speaker/speaker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final String complexity;
  final String description;
  final String presentation;
  @JsonKey(fromJson: _fromJson)
  List<Speaker> speakers;
  final List<String> tags;
  final String title;
  final String videoId;

  Session(
      {this.complexity,
      this.description,
      this.presentation,
      this.speakers,
      this.tags,
      this.title,
      this.videoId});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

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
