import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/data/model/message/message_dto.dart';
import 'package:taskforme/data/model/user/content/content_user_dto.dart';
import 'package:taskforme/data/model/user/user_dto.dart';
import 'package:taskforme/data/network/api_exception.dart';
import 'package:taskforme/data/repository/user_repository_impl.dart';
import 'package:taskforme/domain/entities/user.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockUserRemoteDataSource mockUserRemoteDataSource;
  late UserRepositoryImpl userRepositoryImpl;

  setUp(() {
    mockUserRemoteDataSource = MockUserRemoteDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    userRepositoryImpl =
        UserRepositoryImpl(mockUserRemoteDataSource, mockUserLocalDataSource);
  });

  group('login user', () {
    const username = "John";
    const password = "teste123";

    final testUser =
        User(userId: 1, name: 'John', token: 'fjhsagdkjGSAFHJEYCHdgjadgak');

    final contentUser = ContentUserDto(
      content: UserDto(
          userId: 1, name: 'John', token: 'fjhsagdkjGSAFHJEYCHdgjadgak'),
    );

    final contentUserNull = ContentUserDto(
      content: null,
      message: MessageDto(text: "login failed"),
    );

    setUp(() {
      provideDummy<Result<User, String>>(Success(testUser));
      provideDummy<Result<User, String>>(const Failure(''));
    });

    test('Should return user login successfully', () async {
      //arrange
      when(mockUserRemoteDataSource.login(username, password))
          .thenAnswer((_) async => contentUser);

      //act
      final result = await userRepositoryImpl.login(username, password);

      //assert
      expect(result, isInstanceOf<Success<User, String>>());
      expect((result as Success).value, testUser);
    });

    test('Should return failure when call to data source is unsuccessful',
        () async {
      //arrange
      when(mockUserRemoteDataSource.login("username", "password")).thenThrow(
        APIException(
          jsonEncode(contentUserNull.message?.toJson()),
        ),
      );

      // act
      final result = await userRepositoryImpl.login("username", "password");

      //assert
      expect(result, isInstanceOf<Failure<User, String>>());
      expect((result as Failure).value, contentUserNull.message?.text);
    });
  });
}
