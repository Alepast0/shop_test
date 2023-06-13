import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shop_test/feature/data/models/categories/category_list_items_model.dart';
import 'package:shop_test/feature/data/models/items/list_items_model.dart';

part 'items_api.g.dart';

@RestApi(baseUrl: "https://run.mocky.io")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/v3/058729bd-1402-4578-88de-265481fd7d54")
  Future<CategoryListItemModel> getCategory();

  @GET("/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
  Future<ListItemModel> getCatalog();
}
