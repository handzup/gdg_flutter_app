import 'package:gdg_flutter_app/models/speaker/badge.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'social.dart';

part 'speaker.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Speaker {
  @HiveField(0)
  final String queryPath;
  @HiveField(1)
  final String bio;
  @HiveField(2)
  final String company;
  @HiveField(3)
  final String companyLogoUrl;
  @HiveField(4)
  final String country;
  @HiveField(5)
  final bool featured;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String photoUrl;
  @HiveField(8)
  final String pronouns;
  @HiveField(9)
  final String shortBio;
  @HiveField(10)
  final List<Social> socials;
  @HiveField(11)
  final String title;
  @HiveField(12)
  final List<Badge> badges;

  Speaker(
      {this.badges,
      this.socials,
      this.title,
      this.bio,
      this.company,
      this.companyLogoUrl,
      this.country,
      this.featured,
      this.name,
      this.photoUrl,
      this.pronouns,
      this.shortBio,
      this.queryPath});
  factory Speaker.fromJson(Map<String, dynamic> json, String qrPath) =>
      _$SpeakerFromJson(json, qrPath);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
