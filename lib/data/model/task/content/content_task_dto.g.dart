// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentTaskDto _$ContentTaskDtoFromJson(Map<String, dynamic> json) =>
    ContentTaskDto(
      message: json['message'] == null
          ? null
          : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : TaskDto.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentTaskDtoToJson(ContentTaskDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };

ContentListTaskDto _$ContentListTaskDtoFromJson(Map<String, dynamic> json) =>
    ContentListTaskDto(
      message: json['message'] == null
          ? null
          : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentListTaskDtoToJson(ContentListTaskDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };
