// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelRequest _$LabelRequestFromJson(Map<String, dynamic> json) => LabelRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$LabelRequestToJson(LabelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
    };
