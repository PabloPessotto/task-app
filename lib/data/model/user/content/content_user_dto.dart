import 'package:json_annotation/json_annotation.dart';
import 'package:taskforme/data/model/message/message_dto.dart';
import 'package:taskforme/data/model/user/user_dto.dart';

part 'content_user_dto.g.dart';

@JsonSerializable()
class ContentUserDto {
  @JsonKey(name: 'message')
  MessageDto? message;
  @JsonKey(name: 'content')
  UserDto? content;

  ContentUserDto({this.message, this.content});

  factory ContentUserDto.fromJson(Map<String, dynamic> json) =>
      _$ContentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContentUserDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentUserDto &&
          runtimeType == other.runtimeType &&
          content == other.content;

  @override
  int get hashCode => content.hashCode;
}
