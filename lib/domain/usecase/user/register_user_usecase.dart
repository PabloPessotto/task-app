import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/user.dart';
import 'package:taskforme/domain/repository/user_repository.dart';

class RegisterUserUseCase {
  final UserRepository _userRepository;

  RegisterUserUseCase(this._userRepository);

  Future<Result<User, String>> execute(String username, String password) =>
      _userRepository.register(username, password);
}
