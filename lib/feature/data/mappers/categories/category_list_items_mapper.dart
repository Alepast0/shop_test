import 'package:shop_test/feature/data/mappers/categories/category_items_mapper.dart';
import 'package:shop_test/feature/data/mappers/mapper.dart';
import 'package:shop_test/feature/data/models/categories/category_list_items_model.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_list_entities.dart';

class CategoryListItemMapper extends Mapper<CategoryListItemModel, CategoryListItemEntities> {
  CategoryListItemMapper({required this.categoryItemMapper});

  final CategoryItemMapper categoryItemMapper;

  @override
  CategoryListItemEntities? map(CategoryListItemModel? entity) {
    return CategoryListItemEntities(categories: categoryItemMapper.mapList(entity?.categories));
  }
}
