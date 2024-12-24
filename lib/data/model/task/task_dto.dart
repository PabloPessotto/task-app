import 'package:json_annotation/json_annotation.dart';
import 'package:taskforme/data/model/label/label_dto.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'labels')
  List<LabelDto>? labels;

  TaskDto(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.status,
      this.date,
      this.labels});

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
