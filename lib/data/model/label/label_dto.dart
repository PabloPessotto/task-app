import 'package:json_annotation/json_annotation.dart';

part 'label_dto.g.dart';

@JsonSerializable()
class LabelDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "color")
  String? color;

  LabelDto({this.id, this.name, this.description, this.color});

  Map<String, dynamic> toJson() => _$LabelDtoToJson(this);

  factory LabelDto.fromJson(Map<String, dynamic> json) => _$LabelDtoFromJson(json);
}
