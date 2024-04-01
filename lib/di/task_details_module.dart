import 'package:get/get.dart';
import 'package:taskforme/domain/repository/task_repository.dart';
import 'package:taskforme/domain/usecase/task/delete_task_usecase.dart';
import 'package:taskforme/domain/usecase/task/update_task_status_usecase.dart';
import 'package:taskforme/presenter/view_model/task/task_details_view_model.dart';

class TaskDetailsModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateTaskStatusUseCase>(
      () => UpdateTaskStatusUseCase(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<TaskDetailsViewModel>(
      () => TaskDetailsViewModel(
        Get.find<UpdateTaskStatusUseCase>(),
        Get.find<DeleteTaskUseCase>(),
      ),
    );
  }
}
