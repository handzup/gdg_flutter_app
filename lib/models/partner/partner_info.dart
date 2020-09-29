import 'package:json_annotation/json_annotation.dart';

part 'partner_info.g.dart';

@JsonSerializable()
class PartnerInfo {
  final int order;
  final String name;
  final String url;
  final String logoUrl;

  PartnerInfo({
    this.name,
    this.url,
    this.logoUrl,
    this.order,
  });

  factory PartnerInfo.fromJson(Map<String, dynamic> json) =>
      _$PartnerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerInfoToJson(this);
}
