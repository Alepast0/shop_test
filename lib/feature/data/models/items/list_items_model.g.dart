// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemModel _$ListItemModelFromJson(Map<String, dynamic> json) =>
    ListItemModel(
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => e == null ? null : ItemModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ListItemModelToJson(ListItemModel instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
    };
