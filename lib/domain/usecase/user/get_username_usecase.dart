import 'package:taskforme/domain/repository/user_repository.dart';

class GetUsernameUseCase {
  final UserRepository _userRepository;

  GetUsernameUseCase(this._userRepository);

  String execute() => _userRepository.getUsername();
}
