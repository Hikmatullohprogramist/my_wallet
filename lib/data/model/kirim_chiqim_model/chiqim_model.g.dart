// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chiqim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChiqimModel _$ChiqimModelFromJson(Map<String, dynamic> json) => ChiqimModel(
      id: json['id'] as int,
      userId: json['userId'] as int?,
      narx: json['narx'] as String?,
      izoh: json['izoh'] as String,
      sana: DateTime.parse(json['sana'] as String),
    );

Map<String, dynamic> _$ChiqimModelToJson(ChiqimModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'narx': instance.narx,
      'izoh': instance.izoh,
      'sana': instance.sana.toIso8601String(),
    };
