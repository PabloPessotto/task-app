import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/label.dart';

abstract interface class LabelRepository {
  Future<Result<List<Label>, String>> getLabelList();
  Future<Result<Label, String>> createLabel(Label label);
  Future<Result<Label, String>> updateLabel(Label label);
  Future<Result<String, String>> deleteLabel(int labelId);
}
