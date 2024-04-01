import 'package:get/get.dart';
import 'package:taskforme/di/home_module.dart';
import 'package:taskforme/di/login_module.dart';
import 'package:taskforme/di/register_task_module.dart';
import 'package:taskforme/di/register_user_module.dart';
import 'package:taskforme/di/settings_module.dart';
import 'package:taskforme/di/task_details_module.dart';
import 'package:taskforme/di/task_module.dart';
import 'package:taskforme/di/user_module.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/presenter/view/home/home_view.dart';
import 'package:taskforme/presenter/view/initial_view.dart';
import 'package:taskforme/presenter/view/login/login_view.dart';
import 'package:taskforme/presenter/view/login/register_view.dart';
import 'package:taskforme/presenter/view/settings_view.dart';
import 'package:taskforme/presenter/view/task/register_task_view.dart';
import 'package:taskforme/presenter/view/task/task_details_view.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.initial,
      page: () => const InitialView(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginModule(),
      bindings: [
        UserModule(),
      ],
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: RegisterUserModule(),
      bindings: [
        UserModule(),
      ],
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeModule(),
      bindings: [
        UserModule(),
        TaskModule(),
      ],
    ),
    GetPage(
      name: Routes.registerTask,
      page: () => RegisterTaskView(),
      arguments: Task,
      binding: RegisterTaskModule(),
      bindings: [
        UserModule(),
        TaskModule(),
      ],
    ),
    GetPage(
      name: Routes.taskDetails,
      page: () => TaskDetailsView(),
      arguments: Task,
      binding: TaskDetailsModule(),
      bindings: [
        UserModule(),
        TaskModule(),
      ],
    ),
    GetPage(
      name: Routes.settings,
      page: () => SettingsView(),
      binding: SettingsModule(),
      bindings: [
        UserModule(),
      ],
    ),
  ];
}
