import 'package:json_annotation/json_annotation.dart';

import 'partner_info.dart';
part 'partner.g.dart';

@JsonSerializable()
class Partner {
  final List<PartnerInfo> logos;
  final String order;
  final String title;

  Partner({this.logos, this.order, this.title});

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerToJson(this);
}
