import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/user.dart';
import 'package:taskforme/presenter/view_model/login/login_view_model.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockGetUsernameUseCase mockGetUsernameUseCase;
  late LoginViewModel viewModel;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockGetUsernameUseCase = MockGetUsernameUseCase();
    viewModel = LoginViewModel(mockLoginUseCase, mockGetUsernameUseCase);
  });

  final testUser =
      User(userId: 1, name: 'John', token: 'fjhsagdkjGSAFHJEYCHdgjadgak');

  group('LoginViewModel', () {
    setUp(() {
      provideDummy<Result<User, String>>(Success(testUser));
      provideDummy<Result<User, String>>(const Failure(''));
    });

    test('login with empty username or password should show alert', () async {
      // Arrange
      when(mockGetUsernameUseCase.execute()).thenReturn('username');

      // Act
      await viewModel.login();

      // Assert
      verifyNever(() => mockLoginUseCase.execute(any, any));
    });

    test('login with valid credentials should navigate to home screen', () async {
      // Arrange
      when(mockGetUsernameUseCase.execute()).thenReturn('username');
      when(mockLoginUseCase.execute('username', 'password'))
          .thenAnswer((_) async => Success(testUser));

      // Act
      viewModel.usernameController.text = 'username';
      viewModel.setPassword('password');
      await viewModel.login();

      // Assert
      verify(() => mockLoginUseCase.execute('username', 'password')).called(1);
      expect(Get.currentRoute, Routes.home);
    });

    test('login with invalid credentials should show error snackbar', () async {
      // Arrange
      when(mockGetUsernameUseCase.execute()).thenReturn('username');
      when(mockLoginUseCase.execute('username', 'password'))
          .thenAnswer((_) async => const Failure('Invalid credentials'));

      // Act
      viewModel.usernameController.text = 'username';
      viewModel.setPassword('password');
      await viewModel.login();

      // Assert
      verify(() => mockLoginUseCase.execute('username', 'password')).called(1);
      expect(Get.isSnackbarOpen, true);
    });
  });
}
