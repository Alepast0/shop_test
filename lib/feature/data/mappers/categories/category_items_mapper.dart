import 'package:shop_test/feature/data/mappers/mapper.dart';
import 'package:shop_test/feature/data/models/categories/category_items_model.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_entities.dart';

class CategoryItemMapper extends Mapper<CategoryItemModel, CategoryItemEntities> {
  @override
  CategoryItemEntities? map(CategoryItemModel? entity) {
    return CategoryItemEntities(
        id: entity?.id ?? 0, name: entity?.name ?? '', image_url: entity?.image_url ?? '');
  }
}
