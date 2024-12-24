import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/usecase/label/get_list_label_usecase.dart';
import 'package:taskforme/domain/usecase/task/create_task_usecase.dart';
import 'package:taskforme/domain/usecase/task/edit_task_usecase.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/components/button/alert_buttons/low_alert_button.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/date/current_date.dart';
import 'package:taskforme/shared/functions/date/date_formatter.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/log/console_log.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class RegisterTaskViewModel extends GetxController {
  final CreateTaskUseCase _createTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final GetListLabelUseCase _listLabelUseCase;

  RegisterTaskViewModel(
      this._createTaskUseCase, this._editTaskUseCase, this._listLabelUseCase);

  final RxList<String> _taskLabel = <String>[].obs;
  final RxList<Label> _listLabel = <Label>[].obs;
  final RxList<Label> _listLabelSelected = <Label>[].obs;
  final RxBool _loading = false.obs;
  final RxString _date = getCurrentDate().obs;

  List<String> get taskLabel => _taskLabel;

  RxList<Label> get listLabel => _listLabel;
  RxList<Label> get listLabelSelected => _listLabelSelected;

  bool get loading => _loading.value;

  String get date => _date.value;

  String? _title;
  String? _description;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    _loadTaskToEdit();
    super.onInit();
  }

  @override
  void onReady() {
    loadLabels();
    super.onReady();
  }

  void loadLabels() async {
    final result = await _listLabelUseCase.call();
    if (result case Success(value: final labels)) {
      _listLabel.value = labels;
      log('List Labels - ${labels.map((e) => e.toJson())}');
    }
  }

  void addLabel(Label label) {
    if (!_listLabelSelected.contains(label)) {
      _listLabelSelected.add(label);
    } else {
      _listLabelSelected.remove(label);
    }
  }

  void _updateLoading() {
    _loading.value = !loading;
  }

  void setTitle(String title) {
    _title = title;
  }

  void setDescription(String description) {
    _description = description;
  }

  Future<void> selectTaskDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 07),
      lastDate: DateTime(2101),
      cancelText: 'Cancelar',
      confirmText: 'Salvar',
      helpText: 'Selecione a data',
    );
    _date.value = dateFormatter(selectedDate ?? DateTime.now());
  }

  void createTask() async {
    FocusScope.of(Get.context!).unfocus();
    if ((_title?.isEmpty ?? true)) {
      openAlert(
        const BaseAlert(
          color: Colors.yellow,
          title: "Verifique as informações!",
          message:
              "Verifique se todos os campos estão preenchidos, e tente novamente.",
          functions: [
            HighAlertButton(
              label: "Verificar",
              onTap: closeView,
            ),
          ],
        ),
      );
    } else {
      _updateLoading();
      final String? status = Get.parameters["status"];
      final task = Task(
        title: _title,
        description: _description ?? 'Sem descrição',
        date: date,
        status: status ?? TaskStatus.opened,
        labels: listLabelSelected,
      );
      final result = await _createTaskUseCase.call(task);
      switch (result) {
        case Success(value: final taskCreated):
          print('Task created successfully - ${taskCreated.toJson()}');
          _updateLoading();
          _resetFields();
          openAlert(
            BaseAlert(
              color: Colors.green,
              title: "A tarefa foi criada!",
              message: "Tarefa foi criada com sucesso. Deseja criar mais uma?",
              functions: [
                LowAlertButton(
                  label: "Fechar",
                  onTap: () {
                    closeView();
                    closeView();
                  },
                ),
                const HighAlertButton(
                  label: "Sim, criar",
                  onTap: closeView,
                ),
              ],
            ),
          );
        case Failure():
          _updateLoading();
          openAlert(
            const BaseAlert(
              color: Colors.red,
              title: "A solicitação não pôde ser processada!",
              message:
                  "Não foi possível criar a tarefa. Verifique as informações e tente novamente.",
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
  }

  void _resetFields() {
    _taskLabel.clear();
    _title = null;
    _description = null;
    titleController.clear();
    descriptionController.clear();
    _date.value = getCurrentDate();
  }

  void _loadTaskToEdit() {
    if (Get.arguments != null) {
      final Task task = Get.arguments;
      _title = task.title;
      _description = task.description;
      titleController.text = task.title ?? '';
      descriptionController.text = task.description ?? '';
      // _taskLabel.value = task.label ?? <String>[];
      _date.value = task.date ?? getCurrentDate();
    }
  }

  void updateTask() async {
    FocusScope.of(Get.context!).unfocus();
    if ((_title?.isEmpty ?? true)) {
      openAlert(
        const BaseAlert(
          color: Colors.yellow,
          title: "Verifique as informações!",
          message:
              "Verifique se todos os campos estão preenchidos, e tente novamente.",
          functions: [
            HighAlertButton(
              label: "Verificar",
              onTap: closeView,
            ),
          ],
        ),
      );
    } else {
      final Task taskArgs = Get.arguments;
      _updateLoading();
      final task = Task(
        id: taskArgs.id,
        title: _title,
        description: _description ?? 'Sem descrição',
        date: date,
        // label: taskLabel,
      );
      final result = await _editTaskUseCase.execute(task);
      switch (result) {
        case Success(value: final taskCreated):
          _updateLoading();
          _resetFields();
          closeView(result: taskCreated);
          openSnackBar(
              message: "Tarefa atualizada com sucesso.", color: Colors.green);
        case Failure(value: final message):
          _updateLoading();
          print('Message - $message');
          openAlert(
            const BaseAlert(
              color: Colors.red,
              title: "A solicitação não pôde ser processada!",
              message:
                  "Não foi possível criar a tarefa. Verifique as informações e tente novamente.",
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
  }
}
