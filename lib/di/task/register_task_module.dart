import 'package:get/get.dart';
import 'package:taskforme/domain/repository/label_repository.dart';
import 'package:taskforme/domain/repository/task_repository.dart';
import 'package:taskforme/domain/usecase/label/get_list_label_usecase.dart';
import 'package:taskforme/domain/usecase/task/create_task_usecase.dart';
import 'package:taskforme/domain/usecase/task/edit_task_usecase.dart';
import 'package:taskforme/presenter/view_model/task/register_task_view_model.dart';

class RegisterTaskModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskUseCase>(
      () => CreateTaskUseCase(
        Get.find<TaskRepository>(),
      ),
    );
    Get.lazyPut<EditTaskUseCase>(
      () => EditTaskUseCase(
        Get.find<TaskRepository>(),
      ),
    );
    Get.lazyPut<GetListLabelUseCase>(
      () => GetListLabelUseCase(
        Get.find<LabelRepository>(),
      ),
    );

    Get.lazyPut<RegisterTaskViewModel>(
      () => RegisterTaskViewModel(
        Get.find<CreateTaskUseCase>(),
        Get.find<EditTaskUseCase>(),
        Get.find<GetListLabelUseCase>(),
      ),
    );
  }
}
