import 'package:taskforme/data/model/label/label_dto.dart';
import 'package:taskforme/data/model/request/label/label_request.dart';
import 'package:taskforme/domain/entities/label.dart';

extension LabelMapper on Label? {
  LabelDto toDto() {
    return LabelDto(
      id: this?.id,
      name: this?.name,
      description: this?.description,
      color: this?.color,
    );
  }

  LabelRequest toRequest() {
    return LabelRequest(
      name: this?.name,
      description: this?.description,
      color: this?.color,
    );
  }
}
