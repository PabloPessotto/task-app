// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => LabelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'date': instance.date,
      'labels': instance.labels,
    };
