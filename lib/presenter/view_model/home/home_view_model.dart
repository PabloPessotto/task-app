import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/usecase/task/get_all_tasks_usecase.dart';
import 'package:taskforme/domain/usecase/user/get_username_usecase.dart';
import 'package:taskforme/shared/components/status/status_name.dart';

class HomeViewModel extends GetxController {
  final GetAllTasksUseCase _getAllTasksUseCase;
  final GetUsernameUseCase _getUsernameUseCase;

  HomeViewModel(this._getAllTasksUseCase, this._getUsernameUseCase);

  final RxString _username = ''.obs;
  final RxList<Task> _tasks = RxList<Task>();
  final RxList<Task> _tasksInternal = RxList<Task>();
  final RxString _statusTask = 'todas'.obs;

  String get statusTask => _statusTask.value;

  String get username => _username.value;

  List<Task> get tasks => _tasks;

  List<Task> get tasksInternal => _tasksInternal;

  RxInt quantityByStatus(String status) =>
      _tasksInternal.where((p0) => p0.status == status).length.obs;

  @override
  void onInit() {
    _username.value = _getUsernameUseCase.execute();
    loadListOfTasks();
    super.onInit();
  }

  void filerTasks(String statusFilter) {
    _statusTask.value = statusFilter;
    if (statusFilter == 'todas') {
      _tasks.value = _tasksInternal;
    } else {
      _tasks.value = _tasksInternal
          .where((task) => task.status == status(statusFilter))
          .toList();
    }
  }

  void loadListOfTasks() async {
    final result = await _getAllTasksUseCase.execute();

    switch (result) {
      case Success(value: final listTask):
        print('tasks loaded - ${listTask.map((e) => e.toJson())}');

        _tasksInternal.value = listTask;
        _tasks.value = listTask;

      case Failure(value: final message):
        print('message - $message');
    }
  }
}
