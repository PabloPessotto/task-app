import 'package:taskforme/domain/repository/user_repository.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase(this._userRepository);

  Future<bool> execute() => _userRepository.logout();
}
