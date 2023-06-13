import 'package:shop_test/feature/domain/entities/category_entities/category_list_entities.dart';
import 'package:shop_test/feature/domain/entities/item_entities/Item_list_entities.dart';

abstract class ItemsRepository{
  Future<CategoryListItemEntities?> getCategory();

  Future<ListItemEntities?> getCatalog();
}