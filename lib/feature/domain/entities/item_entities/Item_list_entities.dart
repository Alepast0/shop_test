import 'package:equatable/equatable.dart';
import 'package:shop_test/feature/domain/entities/item_entities/item_entities.dart';

class ListItemEntities extends Equatable{
  final List<ItemEntities> products;

  const ListItemEntities({required this.products});

  @override
  List<Object?> get props => [products];
}