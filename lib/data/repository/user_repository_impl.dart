import 'dart:convert';

import 'package:taskforme/core/result.dart';
import 'package:taskforme/data/datasource/local/user/user_local_data_source.dart';
import 'package:taskforme/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:taskforme/data/mapper/user_dto_mapper.dart';
import 'package:taskforme/data/network/api_exception.dart';
import 'package:taskforme/domain/entities/user.dart';
import 'package:taskforme/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;

  UserRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<User, String>> login(String username, String password) async {
    try {
      final response = await _remoteDataSource.login(username, password);
      final user = response.content;

      if (user != null) {
        await _localDataSource.setToken(user.token!);
        await _localDataSource.setUserId(user.userId!);
        await _localDataSource.setUserName(user.name!);
      }
      return Success(user.toDomain());
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text == "Incorrect password." ? text : text['text']);
    }
  }

  @override
  Future<Result<User, String>> register(
      String username, String password) async {
    try {
      final response = await _remoteDataSource.register(username, password);
      return Success(response.content.toDomain());
    } on APIException catch (e) {
      final message = jsonDecode(e.message!);
      return Failure("$message");
    }
  }

  @override
  String getUsername() {
    return _localDataSource.getUserName();
  }

  @override
  Future<bool> logout() async {
    await _localDataSource.deleteToken();
    final token = _localDataSource.getToken();
    return token.isEmpty;
  }
}
