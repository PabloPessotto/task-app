import 'package:get/get.dart';
import 'package:taskforme/domain/repository/label_repository.dart';
import 'package:taskforme/domain/usecase/label/get_list_label_usecase.dart';
import 'package:taskforme/presenter/view_model/label/list_label_view_model.dart';

class ListLabelModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetListLabelUseCase>(
      () => GetListLabelUseCase(
        Get.find<LabelRepository>(),
      ),
    );
    Get.lazyPut<ListLabelViewModel>(
      () => ListLabelViewModel(
        Get.find<GetListLabelUseCase>(),
      ),
    );
  }
}
