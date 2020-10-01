// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpeakerAdapter extends TypeAdapter<Speaker> {
  @override
  final int typeId = 0;

  @override
  Speaker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Speaker(
      badges: (fields[12] as List)?.cast<dynamic>(),
      socials: (fields[10] as List)?.cast<Social>(),
      title: fields[11] as String,
      bio: fields[1] as String,
      company: fields[2] as String,
      companyLogoUrl: fields[3] as String,
      country: fields[4] as String,
      featured: fields[5] as bool,
      name: fields[6] as String,
      photoUrl: fields[7] as String,
      pronouns: fields[8] as String,
      shortBio: fields[9] as String,
      queryPath: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Speaker obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.queryPath)
      ..writeByte(1)
      ..write(obj.bio)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.companyLogoUrl)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.featured)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.photoUrl)
      ..writeByte(8)
      ..write(obj.pronouns)
      ..writeByte(9)
      ..write(obj.shortBio)
      ..writeByte(10)
      ..write(obj.socials)
      ..writeByte(11)
      ..write(obj.title)
      ..writeByte(12)
      ..write(obj.badges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeakerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json, String qrPath) {
  return Speaker(
    badges: json['badges'] as List,
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
    queryPath: qrPath ?? json['queryPath'] as String,
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
      'badges': instance.badges,
    };
