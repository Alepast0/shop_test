import 'package:shop_test/feature/data/mappers/items/items_mapper.dart';
import 'package:shop_test/feature/data/mappers/mapper.dart';
import 'package:shop_test/feature/data/models/items/list_items_model.dart';
import 'package:shop_test/feature/domain/entities/item_entities/Item_list_entities.dart';

class ListItemMapper extends Mapper<ListItemModel, ListItemEntities> {
  ListItemMapper({required this.itemMapper});

  final ItemMapper itemMapper;

  @override
  ListItemEntities? map(ListItemModel? entity) {
    return ListItemEntities(products: itemMapper.mapList(entity?.dishes));
  }
}
