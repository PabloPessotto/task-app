// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelDto _$LabelDtoFromJson(Map<String, dynamic> json) => LabelDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$LabelDtoToJson(LabelDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
    };
