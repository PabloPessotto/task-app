import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract interface class UserLocalDataSource {
  Future<void> setUserName(String name);
  Future<void> setUserId(int id);
  Future<void> setToken(String token);
  Future<void> deleteToken();

  String getUserName();
  int getUserId();
  String getToken();
}

const String userNameKey = "userName";
const String userIdKey = "userId";
const String tokenKey = "token";

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences _sharedPreferences;

  UserLocalDataSourceImpl(this._sharedPreferences);

  @override
  String getToken() {
    final token = _sharedPreferences.getString(tokenKey) ?? '';
    return token;
  }

  @override
  int getUserId() {
    final userId = _sharedPreferences.getInt(userIdKey) ?? 0;
    return userId;
  }

  @override
  String getUserName() {
    final username = _sharedPreferences.getString(userNameKey) ?? '';
    return username;
  }

  @override
  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(tokenKey, token);
  }

  @override
  Future<void> setUserId(int id) async {
    await _sharedPreferences.setInt(userIdKey, id);
  }

  @override
  Future<void> setUserName(String name) async {
    await _sharedPreferences.setString(userNameKey, name);
  }

  @override
  Future<void> deleteToken() async {
    await _sharedPreferences.remove(tokenKey);
  }
}
