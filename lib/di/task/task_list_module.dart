import 'package:get/get.dart';
import 'package:taskforme/domain/usecase/task/get_all_tasks_usecase.dart';
import 'package:taskforme/presenter/view_model/task/list/task_list_view_model.dart';

class TaskListModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskListViewModel>(
      () => TaskListViewModel(
        Get.find<GetAllTasksUseCase>(tag: 'allTasks'),
      ),
    );
  }
}
