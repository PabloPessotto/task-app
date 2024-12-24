import 'package:json_annotation/json_annotation.dart';
import 'package:taskforme/data/model/label/label_dto.dart';
import 'package:taskforme/data/model/message/message_dto.dart';

part 'content_label_dto.g.dart';

@JsonSerializable()
class ContentLabelDto {
  @JsonKey(name: "message")
  MessageDto? message;
  @JsonKey(name: "content")
  LabelDto? content;

  ContentLabelDto({this.message, this.content});

  Map<String, dynamic> toJson() => _$ContentLabelDtoToJson(this);

  factory ContentLabelDto.fromJson(Map<String, dynamic> json) =>
      _$ContentLabelDtoFromJson(json);
}
