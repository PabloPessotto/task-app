import 'package:get/get.dart';
import 'package:taskforme/domain/repository/label_repository.dart';
import 'package:taskforme/domain/usecase/label/create_label_usecase.dart';
import 'package:taskforme/presenter/view_model/label/register_label_view_model.dart';

class RegisterLabelModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateLabelUseCase>(
      () => CreateLabelUseCase(
        Get.find<LabelRepository>(),
      ),
    );

    Get.lazyPut<RegisterLabelViewModel>(
      () => RegisterLabelViewModel(
        Get.find<CreateLabelUseCase>(),
      ),
    );
  }
}
