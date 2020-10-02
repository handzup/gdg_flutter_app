// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return Partner(
    logos: (json['logos'] as List)
        ?.map((e) =>
            e == null ? null : PartnerInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'logos': instance.logos,
      'title': instance.title,
    };
