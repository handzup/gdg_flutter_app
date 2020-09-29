import 'package:gdg_flutter_app/models/speaker/social.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker {
  final String queryPath;
  final String bio;
  final String company;
  final String companyLogoUrl;
  final String country;
  final bool featured;
  final String name;
  final String photoUrl;
  final String pronouns;
  final String shortBio;
  final List<Social> socials;
  final String title;

  Speaker(
      {this.socials,
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
  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
