import 'package:mockito/annotations.dart';
import 'package:taskforme/data/datasource/local/user/user_local_data_source.dart';
import 'package:taskforme/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:taskforme/data/network/service_client/user/user_service_client.dart';
import 'package:taskforme/domain/repository/user_repository.dart';
import 'package:taskforme/domain/usecase/user/get_username_usecase.dart';
import 'package:taskforme/domain/usecase/user/login_usecase.dart';

@GenerateMocks(
  [
    UserRepository,
    UserRemoteDataSource,
    UserLocalDataSource,
    LoginUseCase,
    GetUsernameUseCase,
    UserServiceClient,
  ],
)
void main() {}
