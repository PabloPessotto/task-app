import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/repository/label_repository.dart';

class GetListLabelUseCase {
  final LabelRepository _labelRepository;

  GetListLabelUseCase(this._labelRepository);

  Future<Result<List<Label>, String>> call() => _labelRepository.getLabelList();
}
