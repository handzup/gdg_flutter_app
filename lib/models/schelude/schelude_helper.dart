import 'package:json_annotation/json_annotation.dart';

import 'schelude_info.dart';

part 'schelude_helper.g.dart';

@JsonSerializable()
class Scheludehelper {
  final ScheludeInfo schelude;
  final String date;

  Scheludehelper({this.schelude, this.date});

  factory Scheludehelper.fromJson(Map<String, dynamic> json) =>
      _$ScheludehelperFromJson(json);

  Map<String, dynamic> toJson() => _$ScheludehelperToJson(this);
}
