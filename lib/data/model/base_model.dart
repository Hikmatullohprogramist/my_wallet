
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseResponse{
  String status;
  final dynamic data;

  BaseResponse(this.status,   this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json)=>_$BaseResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$BaseResponseToJson(this);


}