import 'package:dio/dio.dart';
import 'package:flutter_sample/src/mvvm/global_const.dart';
import 'package:flutter_sample/src/mvvm/response_data.dart';
import 'package:retrofit/http.dart';

part 'api.client.g.dart';

// retrofit generator is required for auto
@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClients {
  factory ApiClients(Dio dio, {String baseUrl}) = _ApiClients;

  @GET(GlobalConst.userEndpoint)
  Future<ResponseData> getUsers();
}