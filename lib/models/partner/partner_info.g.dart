// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerInfo _$PartnerInfoFromJson(Map<String, dynamic> json) {
  return PartnerInfo(
    name: json['name'] as String,
    url: json['url'] as String,
    logoUrl: json['logoUrl'] as String,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$PartnerInfoToJson(PartnerInfo instance) =>
    <String, dynamic>{
      'order': instance.order,
      'name': instance.name,
      'url': instance.url,
      'logoUrl': instance.logoUrl,
    };
