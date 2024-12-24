import 'package:json_annotation/json_annotation.dart';

part 'label_request.g.dart';

@JsonSerializable()
class LabelRequest {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "color")
  String? color;

  LabelRequest({this.name, this.description, this.color});

  Map<String, dynamic> toJson() => _$LabelRequestToJson(this);

  factory LabelRequest.fromJson(Map<String, dynamic> json) =>
      _$LabelRequestFromJson(json);
}
