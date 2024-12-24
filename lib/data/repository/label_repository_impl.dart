import 'package:taskforme/core/result.dart';
import 'package:taskforme/data/datasource/remote/label/label_remote_data_source.dart';
import 'package:taskforme/data/mapper/label_dto_mapper.dart';
import 'package:taskforme/data/network/api_exception.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/domain/mapper/label_mapper.dart';
import 'package:taskforme/domain/repository/label_repository.dart';

class LabelRepositoryImpl implements LabelRepository {
  final LabelRemoteDataSource _labelRemoteDataSource;

  LabelRepositoryImpl(this._labelRemoteDataSource);

  @override
  Future<Result<Label, String>> createLabel(Label label) async {
    try {
      final response = await _labelRemoteDataSource.postLabel(label.toRequest());
      final created = response.content.toDomain();
      return Success(created);
    } on APIException {
      return const Failure('');
    }
  }

  @override
  Future<Result<String, String>> deleteLabel(int labelId) async {
    try {
      final response = await _labelRemoteDataSource.deleteLabel(labelId);
      final deleted = response.message?.text ?? '';
      return Success(deleted);
    } on APIException {
      return const Failure('');
    }
  }

  @override
  Future<Result<List<Label>, String>> getLabelList() async {
    try {
      final response = await _labelRemoteDataSource.getLabelList();
      final listLabel = response.content?.map((e) => e.toDomain()).toList() ?? [];
      return Success(listLabel);
    } on APIException {
      return const Failure('');
    }
  }

  @override
  Future<Result<Label, String>> updateLabel(Label label) async {
    try {
      final response =
          await _labelRemoteDataSource.putLabel(label.id!, label.toRequest());
      final updated = response.content.toDomain();
      return Success(updated);
    } on APIException {
      return const Failure('');
    }
  }
}
