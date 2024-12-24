import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/usecase/label/create_label_usecase.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/components/button/alert_buttons/low_alert_button.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class RegisterLabelViewModel extends GetxController {
  final CreateLabelUseCase _createLabelUseCase;

  RegisterLabelViewModel(this._createLabelUseCase);

  final TextEditingController labelNameController = TextEditingController();
  final TextEditingController labelDescriptionController = TextEditingController();
  final TextEditingController labelColorController = TextEditingController();

  String? _labelName;
  String? _labelDescription;
  final RxString _labelColor = "".obs;
  final RxBool _loading = false.obs;

  String get labelColor => _labelColor.value;

  bool get loading => _loading.value;

  @override
  void onInit() {
    labelColorController.text = "#4caf50";
    _labelColor.value = "#4caf50";
    super.onInit();
  }

  void setLabelName(String labelName) {
    _labelName = labelName;
  }

  void setLabelDescription(String labelDescription) {
    _labelDescription = labelDescription;
  }

  void setLabelColor(String labelColor) {
    if (!labelColor.contains('#')) {
      _labelColor.value = "#$labelColor";
    } else {
      _labelColor.value = labelColor;
    }
  }

  void changeColor(String hex) {
    labelColorController.text = hex;
    _labelColor.value = hex;
  }

  void _updateLoading() {
    _loading.value = !loading;
  }

  Future<void> createLabel() async {
    _updateLoading();
    final label = Label(
      name: _labelName,
      description: _labelDescription,
      color: labelColor,
    );
    final result = await _createLabelUseCase.call(label);
    switch (result) {
      case Success(value: final labelCreated):
        _updateLoading();
        print('label created successfully - ${labelCreated.toJson()}');
        labelNameController.clear();
        labelDescriptionController.clear();
        _labelName = null;
        _labelDescription = null;
        openAlert(
          BaseAlert(
            color: Colors.green,
            title: "Etiqueta criada!",
            message: "Etiqueta criada com sucesso. Deseja adicionar mais?",
            functions: [
              LowAlertButton(
                label: "Fechar",
                onTap: () {
                  closeView();
                  closeView();
                },
              ),
              const HighAlertButton(
                label: "Sim, adicionar",
                onTap: closeView,
              ),
            ],
          ),
        );
      case Failure():
        _updateLoading();
    }
  }
}
