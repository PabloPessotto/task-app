import 'package:get/get.dart';
import 'package:taskforme/domain/repository/task_repository.dart';
import 'package:taskforme/domain/repository/user_repository.dart';
import 'package:taskforme/domain/usecase/task/get_all_tasks_usecase.dart';
import 'package:taskforme/domain/usecase/user/get_username_usecase.dart';
import 'package:taskforme/presenter/view_model/home/home_view_model.dart';

class HomeModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllTasksUseCase>(
      () => GetAllTasksUseCase(
        Get.find<TaskRepository>(),
      ),
      tag: 'allTasks',
    );

    Get.lazyPut<GetUsernameUseCase>(
      () => GetUsernameUseCase(
        Get.find<UserRepository>(),
      ),
    );

    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(
        Get.find<GetAllTasksUseCase>(tag: 'allTasks'),
        Get.find<GetUsernameUseCase>(),
      ),
    );
  }
}
