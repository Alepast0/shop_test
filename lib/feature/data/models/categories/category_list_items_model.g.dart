// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListItemModel _$CategoryListItemModelFromJson(
        Map<String, dynamic> json) =>
    CategoryListItemModel(
      categories: (json['сategories'] as List<dynamic>)
          .map((e) => e == null ? null : CategoryItemModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$CategoryListItemModelToJson(
        CategoryListItemModel instance) =>
    <String, dynamic>{
      'сategories': instance.categories,
    };
