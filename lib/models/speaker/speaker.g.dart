// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return Speaker(
    socials: (json['socials'] as List)
        ?.map((e) =>
            e == null ? null : Social.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    bio: json['bio'] as String,
    company: json['company'] as String,
    companyLogoUrl: json['companyLogoUrl'] as String,
    country: json['country'] as String,
    featured: json['featured'] as bool,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    pronouns: json['pronouns'] as String,
    shortBio: json['shortBio'] as String,
    queryPath: json['queryPath'] as String,
  );
}

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'queryPath': instance.queryPath,
      'bio': instance.bio,
      'company': instance.company,
      'companyLogoUrl': instance.companyLogoUrl,
      'country': instance.country,
      'featured': instance.featured,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'pronouns': instance.pronouns,
      'shortBio': instance.shortBio,
      'socials': instance.socials,
      'title': instance.title,
    };
