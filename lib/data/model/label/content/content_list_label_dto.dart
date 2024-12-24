import 'package:json_annotation/json_annotation.dart';
import 'package:taskforme/data/model/label/label_dto.dart';
import 'package:taskforme/data/model/message/message_dto.dart';

part 'content_list_label_dto.g.dart';

@JsonSerializable()
class ContentListLabelDto {
  @JsonKey(name: "message")
  MessageDto? message;
  @JsonKey(name: "content")
  List<LabelDto>? content;

  ContentListLabelDto({this.message, this.content});

  Map<String, dynamic> toJson() => _$ContentListLabelDtoToJson(this);

  factory ContentListLabelDto.fromJson(Map<String, dynamic> json) =>
      _$ContentListLabelDtoFromJson(json);
}
