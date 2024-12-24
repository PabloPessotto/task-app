import 'package:taskforme/data/model/label/content/content_label_dto.dart';
import 'package:taskforme/data/model/label/content/content_list_label_dto.dart';
import 'package:taskforme/data/model/request/label/label_request.dart';
import 'package:taskforme/data/network/service_client/label/label_service_client.dart';

abstract interface class LabelRemoteDataSource {
  Future<ContentListLabelDto> getLabelList();

  Future<ContentLabelDto> deleteLabel(int id);

  Future<ContentLabelDto> postLabel(LabelRequest label);

  Future<ContentLabelDto> putLabel(int id, LabelRequest label);
}

class LabelRemoteDataSourceImpl implements LabelRemoteDataSource {
  final LabelServiceClient _labelServiceClient;

  LabelRemoteDataSourceImpl(this._labelServiceClient);

  @override
  Future<ContentLabelDto> deleteLabel(int id) async {
    return await _labelServiceClient.deleteLabel(id);
  }

  @override
  Future<ContentListLabelDto> getLabelList() async {
    return await _labelServiceClient.getLabelList();
  }

  @override
  Future<ContentLabelDto> postLabel(LabelRequest label) async {
    return await _labelServiceClient.postLabel(label);
  }

  @override
  Future<ContentLabelDto> putLabel(int id, LabelRequest label) async {
    return await _labelServiceClient.putLabel(id, label);
  }
}
