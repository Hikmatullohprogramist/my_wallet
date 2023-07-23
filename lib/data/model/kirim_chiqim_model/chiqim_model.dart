import 'package:json_annotation/json_annotation.dart';

part 'chiqim_model.g.dart';

@JsonSerializable()
class ChiqimModel {
  int id;
  int? userId;
  String? narx;
  String izoh;
  DateTime sana;

  ChiqimModel({
    required this.id,
    required this.userId,
    required this.narx,
    required this.izoh,
    required this.sana,
  });

  factory ChiqimModel.fromJson(Map<String, dynamic> json) =>
      _$ChiqimModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChiqimModelToJson(this);
}
