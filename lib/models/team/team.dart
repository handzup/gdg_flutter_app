import 'package:gdg_flutter_app/models/speaker/speaker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {
  final List<Speaker> members;
  final String title;

  Team({this.members, this.title});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
