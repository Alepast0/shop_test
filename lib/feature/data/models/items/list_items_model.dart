import 'package:json_annotation/json_annotation.dart';
import 'package:shop_test/feature/data/models/items/items_model.dart';

part 'list_items_model.g.dart';

@JsonSerializable()
class ListItemModel {
  final List<ItemModel?> dishes;

  ListItemModel({required this.dishes});

  factory ListItemModel.fromJson(Object? json) =>
      _$ListItemModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ListItemModelToJson(this);
}
