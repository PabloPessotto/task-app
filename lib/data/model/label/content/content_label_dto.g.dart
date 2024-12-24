// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_label_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentLabelDto _$ContentLabelDtoFromJson(Map<String, dynamic> json) =>
    ContentLabelDto(
      message: json['message'] == null
          ? null
          : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : LabelDto.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentLabelDtoToJson(ContentLabelDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };
