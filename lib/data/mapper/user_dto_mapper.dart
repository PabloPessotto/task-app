import 'package:taskforme/data/model/user/user_dto.dart';
import 'package:taskforme/domain/entities/user.dart';

extension UserDtoMapper on UserDto? {
  User toDomain() {
    return User(
      name: this?.name,
      userId: this?.userId,
      token: this?.token,
    );
  }
}
