import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Social {
  @HiveField(0)
  final String icon;
  @HiveField(1)
  final String link;
  @HiveField(2)
  final String name;

  Social({this.icon, this.link, this.name});

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
