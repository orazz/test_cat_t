import 'package:cat_t/helpers/api_const.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/fact.dart';
part 'api.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @GET("${ApiConst.cBaseUrl}/facts/random?animal_type=cat&amount=1")
  Future<Fact> fetchFact();

  @GET("${ApiConst.cImageUrl}/cat?json=true")
  Future<CatImage> fetchImage();
}
