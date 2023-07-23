// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kirim_chiqim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KirimModel _$KirimModelFromJson(Map<String, dynamic> json) => KirimModel(
      id: json['id'] as int,
      userId: json['userId'] as int?,
      narx: json['narx'] as String?,
      izoh: json['izoh'] as String,
      sana: DateTime.parse(json['sana'] as String),
    );

Map<String, dynamic> _$KirimModelToJson(KirimModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'narx': instance.narx,
      'izoh': instance.izoh,
      'sana': instance.sana.toIso8601String(),
    };
