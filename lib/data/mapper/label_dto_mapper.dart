import 'package:taskforme/data/model/label/label_dto.dart';
import 'package:taskforme/domain/entities/label.dart';

extension LabelDtoMapper on LabelDto? {
  Label toDomain() {
    return Label(
      id: this?.id,
      name: this?.name,
      description: this?.description,
      color: this?.color,
    );
  }
}
