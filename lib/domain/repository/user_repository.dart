import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User, String>> register(String username, String password);
  Future<Result<User, String>> login(String username, String password);
  String getUsername();
  Future<bool> logout();
}
