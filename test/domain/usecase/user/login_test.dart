import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/user.dart';
import 'package:taskforme/domain/usecase/user/login_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late LoginUseCase loginUseCase;
  late MockUserRepository mockUserRepository;

  final testUser =
      User(userId: 1, name: 'John', token: 'fjhsagdkjGSAFHJEYCHdgjadgak');

  const username = 'John';
  const password = 'teste123';

  setUp(() {
    mockUserRepository = MockUserRepository();
    loginUseCase = LoginUseCase(mockUserRepository);
    provideDummy<Result<User, String>>(Success(testUser));
    // provideDummy<Result<User, String>>(const Failure(''));
  });

  test('LoginUseCase should return Success on successful login', () async {
    // when(mockUserRepository.login(username, password))
    //     .thenAnswer((_) => Future<Result<User, String>>.value(Success(testUser)));

    when(mockUserRepository.login(username, password))
        .thenAnswer((_) async => Success(testUser));

    final result = await loginUseCase.execute(username, password);

    print('result: $result');

    expect(result, isInstanceOf<Success<User, String>>());
  });
}
