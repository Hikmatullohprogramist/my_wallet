import 'package:json_annotation/json_annotation.dart';

part 'kirim_chiqim_model.g.dart';

@JsonSerializable()
class KirimModel {
  int id;
  int? userId;
  String? narx;
  String izoh;
  DateTime sana;

  KirimModel({
    required this.id,
    required this.userId,
    required this.narx,
    required this.izoh,
    required this.sana,
  });

  factory KirimModel.fromJson(Map<String, dynamic> json) =>
      _$KirimModelFromJson(json);

  Map<String, dynamic> toJson() => _$KirimModelToJson(this);
}
