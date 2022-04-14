import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';
// Raw model
@JsonSerializable()
class ResponseData {
  int code;
  dynamic meta;
  List<dynamic>? data;

  ResponseData({required this.code, this.meta, this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
