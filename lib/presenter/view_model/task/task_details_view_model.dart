import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/usecase/task/delete_task_usecase.dart';
import 'package:taskforme/domain/usecase/task/update_task_status_usecase.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/components/button/alert_buttons/low_alert_button.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class TaskDetailsViewModel extends GetxController {
  final UpdateTaskStatusUseCase _updateTaskStatusUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskDetailsViewModel(this._updateTaskStatusUseCase, this._deleteTaskUseCase);

  final Rx<Task> _task = Rx<Task>(Task());
  final RxString _statusTask = ''.obs;

  Task get task => _task.value;

  String get statusTask => _statusTask.value;

  @override
  void onInit() {
    updateTask(Get.arguments);
    _statusTask.value = task.status!;
    super.onInit();
  }

  Future<void> updateTaskStatus(String status) async {
    final result = await _updateTaskStatusUseCase.execute(status, task.id!);
    switch (result) {
      case Success(value: final updated):
        _statusTask.value = updated.status!;
        openSnackBar(message: "Tarefa atualizada com sucesso.", color: Colors.green);
      case Failure():
        openAlert(
          const BaseAlert(
            color: Colors.red,
            title: "A solicitação não pôde ser processada!",
            message: "Não foi possível atualizar a tarefa. Tente novamente.",
            functions: [
              HighAlertButton(
                label: "Verificar",
                onTap: closeView,
              ),
            ],
          ),
        );
    }
  }

  void deleteTask() async {
    openAlert(
      BaseAlert(
        color: Colors.yellow,
        title: "Tem certeza de que deseja deletar esta tarefa?",
        message:
            "Esta ação não pode ser desfeita. O relatório será excluído permanentemente.",
        functions: [
          LowAlertButton(
            label: "Sim, deletar",
            onTap: () async {
              closeView();
              final result = await _deleteTaskUseCase.execute(task.id!);
              switch (result) {
                case Success():
                  closeView();
                  openSnackBar(
                      message: "Tarefa removida com sucesso.", color: Colors.green);
                case Failure():
                  openAlert(
                    const BaseAlert(
                      color: Colors.red,
                      title: "A solicitação não pôde ser processada!",
                      message: "Não foi possível deletar tarefa. Tente novamente.",
                      functions: [
                        HighAlertButton(
                          label: "Fechar",
                          onTap: closeView,
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
          const HighAlertButton(
            label: "Fechar",
            onTap: closeView,
          ),
        ],
      ),
    );
  }

  void updateTask(Task task) {
    _task.value = task;
  }
}
