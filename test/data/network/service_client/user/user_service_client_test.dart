import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:taskforme/data/model/user/content/content_user_dto.dart';
import 'package:taskforme/data/network/service_client/user/user_service_client.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late UserServiceClient userServiceClient;

  const baseUrl = 'http://ec2-44-199-92-143.compute-1.amazonaws.com/api';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
    userServiceClient = UserServiceClient(dio);
  });

  const userCredentials = {
    'name': 'John',
    'password': 'teste123',
  };

  group('login user service client', () {
    final contentUserDto = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_response.json')));

    final contentUser404 = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_404_response.json')));

    final contentUser401 = ContentUserDto.fromJson(jsonDecode(
        readJson('helpers/dummy_data/login/dummy_login_401_response.json')));

    test('Should return user when the response is 201', () async {
      //arrange
      // Mock the API response
      dioAdapter.onPost(
        '/login',
        data: userCredentials,
        (server) {
          server.reply(
            201,
            jsonDecode(
              readJson('helpers/dummy_data/login/dummy_login_response.json'),
            ),
          );
        },
      );

      // act
      final result = await userServiceClient.login(
          userCredentials["name"]!, userCredentials["password"]!);

      // assert
      expect(result, equals(contentUserDto));
    });

    test('Should return response 401 when password is incorrect', () async {
      //arrange
      dioAdapter.onPost(
        '/login',
        data: {"name": "John", "password": "teste133"},
        (server) {
          server.reply(
            401,
            jsonDecode(
              readJson(
                  'helpers/dummy_data/login/dummy_login_401_response.json'),
            ),
          );
        },
      );

      try {
        //act
        await userServiceClient.login("John", "teste133");
        fail("Expected an error to be thrown");
      } on DioException catch (err) {
        //assert
        expect(
          ContentUserDto.fromJson(err.response!.data),
          equals(contentUser401),
        );
      }
    });

    test('Should return response 404 when user not found', () async {
      //arrange
      dioAdapter.onPost('/login',
          data: {"name": "john", "password": "teste123"}, (server) {
        server.reply(
          404,
          jsonDecode(readJson(
              'helpers/dummy_data/login/dummy_login_404_response.json')),
        );
      });

      try {
        //act
        await userServiceClient.login("john", "teste123");
        fail("Expected an error to be thrown");
      } on DioException catch (err) {
        //assert
        expect(
          ContentUserDto.fromJson(err.response!.data),
          equals(contentUser404),
        );
      }
    });
  });
}
