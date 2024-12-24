import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/usecase/label/get_list_label_usecase.dart';
import 'package:taskforme/shared/functions/log/console_log.dart';

class ListLabelViewModel extends GetxController {
  final GetListLabelUseCase _listLabelUseCase;

  ListLabelViewModel(this._listLabelUseCase);

  final RxList<Label> _listLabel = <Label>[].obs;

  RxList<Label> get listLabel => _listLabel;

  @override
  void onInit() {
    loadLabels();
    super.onInit();
  }

  void loadLabels() async {
    final result = await _listLabelUseCase.call();
    if (result case Success(value: final labels)) {
      _listLabel.value = labels;
      log('List Labels - ${labels.map((e) => e.toJson())}');
    }
  }
}
