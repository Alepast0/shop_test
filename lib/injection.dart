import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shop_test/feature/data/mappers/categories/category_items_mapper.dart';
import 'package:shop_test/feature/data/mappers/categories/category_list_items_mapper.dart';
import 'package:shop_test/feature/data/mappers/items/items_mapper.dart';
import 'package:shop_test/feature/data/mappers/items/list_items_mapper.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';
import 'package:shop_test/feature/data/repositories/basket_repository.dart';
import 'package:shop_test/feature/data/repositories/items_repository.dart';
import 'package:shop_test/feature/domain/repositories/basket_repository.dart';

import 'feature/domain/repositories/items_repositury.dart';

Future<Widget> injection(Widget app) async {
  // Mappers
  final itemMapper = ItemMapper();
  final listItemMapper = ListItemMapper(itemMapper: itemMapper);
  final categoryItemMapper = CategoryItemMapper();
  final categoryListItemMapper = CategoryListItemMapper(categoryItemMapper: categoryItemMapper);
  //Hive
  final basketBox = Hive.box<BasketItemModel>('basket');

  //Repositories
  final itemRepositoryImpl = ItemsRepositoryImpl(
      categoryListItemMapper: categoryListItemMapper, listItemMapper: listItemMapper);
  final basketRepositoryImpl = BasketRepositoryImpl(basketBox);

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<ItemsRepository>(create: (_) => itemRepositoryImpl),
    RepositoryProvider<BasketRepository>(create: (_) => basketRepositoryImpl)
  ], child: app);
}
