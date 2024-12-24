import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/usecase/task/get_all_tasks_usecase.dart';
import 'package:taskforme/shared/components/status/status_name.dart';

class TaskListViewModel extends GetxController {
  final GetAllTasksUseCase _getAllTasksUseCase;

  TaskListViewModel(this._getAllTasksUseCase);

  final RxList<Task> _tasks = RxList<Task>();
  final RxList<Task> _allTasks = RxList<Task>();
  final RxString _statusTask = 'todas'.obs;

  String get statusTask => _statusTask.value;

  RxList<Task> get tasks => _tasks;

  RxList<Task> get allTasks => _allTasks;

  @override
  void onInit() {
    loadListOfTasks();
    super.onInit();
  }

  void loadListOfTasks() async {
    final result = await _getAllTasksUseCase.execute();

    switch (result) {
      case Success(value: final listTask):
        print('tasks loaded - ${listTask.map((e) => e.toJson())}');

        _allTasks.value = listTask;
        filerTasks(statusTask);

      case Failure(value: final message):
        print('message - $message');
    }
  }

  void filerTasks(String statusFilter) {
    _statusTask.value = statusFilter;
    if (statusFilter == 'todas') {
      _tasks.value = _allTasks;
    } else {
      _tasks.value =
          _allTasks.where((task) => task.status == status(statusFilter)).toList();
    }
  }
}
