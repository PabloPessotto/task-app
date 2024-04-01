import 'package:json_annotation/json_annotation.dart';
import 'package:taskforme/data/model/message/message_dto.dart';
import 'package:taskforme/data/model/task/task_dto.dart';

part 'content_task_dto.g.dart';

@JsonSerializable()
class ContentTaskDto {
  @JsonKey(name: 'message')
  MessageDto? message;
  @JsonKey(name: 'content')
  TaskDto? content;

  ContentTaskDto({this.message, this.content});

  factory ContentTaskDto.fromJson(Map<String, dynamic> json) =>
      _$ContentTaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContentTaskDtoToJson(this);
}

@JsonSerializable()
class ContentListTaskDto {
  @JsonKey(name: 'message')
  MessageDto? message;
  @JsonKey(name: 'content')
  List<TaskDto>? content;

  ContentListTaskDto({this.message, this.content});

  factory ContentListTaskDto.fromJson(Map<String, dynamic> json) =>
      _$ContentListTaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContentListTaskDtoToJson(this);
}
