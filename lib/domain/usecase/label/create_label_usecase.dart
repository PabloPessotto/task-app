import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/repository/label_repository.dart';

class CreateLabelUseCase {
  final LabelRepository _labelRepository;

  CreateLabelUseCase(this._labelRepository);

  Future<Result<Label, String>> call(Label label) =>
      _labelRepository.createLabel(label);
}
