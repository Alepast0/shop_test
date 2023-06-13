// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      weight: json['weight'] as int?,
      description: json['description'] as String?,
      image_url: json['image_url'] as String?,
      tegs: (json['tegs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'description': instance.description,
      'image_url': instance.image_url,
      'tegs': instance.tegs,
    };
