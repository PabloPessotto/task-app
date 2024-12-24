import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskforme/data/model/label/content/content_label_dto.dart';
import 'package:taskforme/data/model/label/content/content_list_label_dto.dart';
import 'package:taskforme/data/model/request/label/label_request.dart';

part 'label_service_client.g.dart';

@RestApi()
abstract interface class LabelServiceClient {
  factory LabelServiceClient(Dio dio, {String? baseUrl}) = _LabelServiceClient;

  @GET('/labels')
  Future<ContentListLabelDto> getLabelList();

  @DELETE('/label/{id}')
  Future<ContentLabelDto> deleteLabel(@Path('id') int id);

  @POST('/label')
  Future<ContentLabelDto> postLabel(@Body() LabelRequest label);

  @PUT('/label/{id}')
  Future<ContentLabelDto> putLabel(@Path('id') int id, @Body() LabelRequest label);
}
