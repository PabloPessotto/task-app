// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) => TaskRequest(
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$TaskRequestToJson(TaskRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'date': instance.date,
      'labels': instance.labels,
    };
