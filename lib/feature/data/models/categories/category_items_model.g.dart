// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) =>
    CategoryItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$CategoryItemModelToJson(CategoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image_url,
    };
