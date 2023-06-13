import 'package:shop_test/feature/data/mappers/mapper.dart';
import 'package:shop_test/feature/data/models/items/items_model.dart';
import 'package:shop_test/feature/domain/entities/item_entities/item_entities.dart';

class ItemMapper extends Mapper<ItemModel, ItemEntities> {
  @override
  ItemEntities? map(ItemModel? entity) {
    return ItemEntities(
        id: entity?.id ?? 0,
        name: entity?.name ?? '',
        price: entity?.price ?? 0,
        weight: entity?.weight ?? 0,
        description: entity?.description ?? '',
        image_url: entity?.image_url ?? '',
        tegs: entity?.tegs ?? []);
  }
}
