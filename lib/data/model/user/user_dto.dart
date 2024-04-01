import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'token')
  String? token;

  UserDto({this.userId, this.name, this.token});

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
