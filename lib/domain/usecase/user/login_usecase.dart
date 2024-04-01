import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/user.dart';
import 'package:taskforme/domain/repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<Result<User, String>> execute(String username, String password) =>
      _userRepository.login(username, password);
}
