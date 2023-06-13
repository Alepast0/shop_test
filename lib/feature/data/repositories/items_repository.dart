import 'package:dio/dio.dart';
import 'package:shop_test/feature/data/mappers/categories/category_list_items_mapper.dart';
import 'package:shop_test/feature/data/mappers/items/list_items_mapper.dart';
import 'package:shop_test/feature/data/remote/items_api.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_list_entities.dart';
import 'package:shop_test/feature/domain/entities/item_entities/Item_list_entities.dart';
import 'package:shop_test/feature/domain/repositories/items_repositury.dart';

class ItemsRequestFailure implements Exception {}

class CategoryRequestFailure implements Exception {}

class ItemsRepositoryImpl implements ItemsRepository {
  ItemsRepositoryImpl({required this.categoryListItemMapper, required this.listItemMapper});

  final CategoryListItemMapper categoryListItemMapper;
  final ListItemMapper listItemMapper;
  final ApiService apiService = ApiService(Dio());

  @override
  Future<CategoryListItemEntities?> getCategory() async {
    try {
      final response = await apiService.getCategory();
      final category = categoryListItemMapper.map(response);
      return category;
    } catch (e) {
      throw CategoryRequestFailure();
    }
  }

  @override
  Future<ListItemEntities?> getCatalog() async {
    try {
      final response = await apiService.getCatalog();
      final listItem = listItemMapper.map(response);
      return listItem;
    } catch (e) {
      throw ItemsRequestFailure();
    }
  }
}
