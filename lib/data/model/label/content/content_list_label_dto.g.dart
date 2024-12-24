// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_list_label_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentListLabelDto _$ContentListLabelDtoFromJson(Map<String, dynamic> json) =>
    ContentListLabelDto(
      message: json['message'] == null
          ? null
          : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => LabelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentListLabelDtoToJson(
        ContentListLabelDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };
