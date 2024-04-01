import 'package:taskforme/data/model/user/content/content_user_dto.dart';
import 'package:taskforme/data/network/service_client/user/user_service_client.dart';

abstract interface class UserRemoteDataSource {
  Future<ContentUserDto> register(String name, String password);

  Future<ContentUserDto> login(String name, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserServiceClient _userServiceClient;

  UserRemoteDataSourceImpl(this._userServiceClient);

  @override
  Future<ContentUserDto> login(String name, String password) async {
    return await _userServiceClient.login(name, password);
  }

  @override
  Future<ContentUserDto> register(String name, String password) async {
    return await _userServiceClient.register(name, password);
  }
}
