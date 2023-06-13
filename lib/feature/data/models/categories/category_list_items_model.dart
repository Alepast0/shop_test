import 'package:json_annotation/json_annotation.dart';
import 'package:shop_test/feature/data/models/categories/category_items_model.dart';

part 'category_list_items_model.g.dart';

@JsonSerializable()
class CategoryListItemModel {
  final List<CategoryItemModel?> categories;

  CategoryListItemModel({required this.categories});

  factory CategoryListItemModel.fromJson(Object? json) =>
      _$CategoryListItemModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CategoryListItemModelToJson(this);
}
