// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentUserDto _$ContentUserDtoFromJson(Map<String, dynamic> json) =>
    ContentUserDto(
      message: json['message'] == null
          ? null
          : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : UserDto.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentUserDtoToJson(ContentUserDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };
