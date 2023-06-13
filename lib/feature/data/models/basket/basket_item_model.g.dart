// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketItemModel _$BasketItemModelFromJson(Map<String, dynamic> json) =>
    BasketItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image_url: json['image_url'] as String?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$BasketItemModelToJson(BasketItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image_url,
      'price': instance.price,
      'quantity': instance.quantity,
      'weight': instance.weight,
    };
