import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskforme/data/model/user/content/content_user_dto.dart';

part 'user_service_client.g.dart';

@RestApi()
abstract interface class UserServiceClient {
  factory UserServiceClient(Dio dio, {String? baseUrl}) = _UserServiceClient;

  @POST('/register')
  Future<ContentUserDto> register(
      @Field("name") String name, @Field("password") String password);

  @POST('/login')
  Future<ContentUserDto> login(
      @Field("name") String name, @Field("password") String password);
}
