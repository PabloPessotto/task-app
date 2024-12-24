import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taskforme/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:taskforme/data/model/user/content/content_user_dto.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockUserServiceClient mockUserServiceClient;
  late UserRemoteDataSourceImpl userRemoteDataSourceImpl;

  const userCredentials = {
    'name': 'John',
    'password': 'teste123',
  };

  setUp(() {
    mockUserServiceClient = MockUserServiceClient();
    userRemoteDataSourceImpl = UserRemoteDataSourceImpl(mockUserServiceClient);
  });

  group('login user data source', () {
    final contentUserDto = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_response.json')));

    final contentUser404 = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_404_response.json')));

    final contentUser401 = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_401_response.json')));

    test('Should return user when the response is 201', () async {
      //arrange
      when(mockUserServiceClient.login(
              userCredentials["name"]!, userCredentials["password"]!))
          .thenAnswer((_) async => contentUserDto);

      // act
      final result = await userRemoteDataSourceImpl.login(
          userCredentials["name"]!, userCredentials["password"]!);

      // assert
      expect(result, equals(contentUserDto));
    });

    test('Should return response 401 when password is incorrect', () async {
      //arrange
      when(mockUserServiceClient.login("John", "teste133"))
          .thenAnswer((_) async => contentUser401);
      //act
      final result = await userRemoteDataSourceImpl.login("John", "teste133");

      //assert
      expect(result, equals(contentUser401));
    });

    test('Should return response 404 when user not found', () async {
      //arrange
      when(mockUserServiceClient.login("john", "teste123"))
          .thenAnswer((_) async => contentUser404);

      //act
      final result = await userRemoteDataSourceImpl.login("john", "teste123");

      //assert
      expect(result, equals(contentUser404));
    });
  });
}
