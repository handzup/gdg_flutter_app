import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'badge.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Badge {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final String link;
  @HiveField(2)
  final String name;

  Badge({
    this.description,
    this.link,
    this.name,
  });
  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeToJson(this);
}
