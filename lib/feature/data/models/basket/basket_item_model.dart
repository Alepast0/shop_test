import 'package:json_annotation/json_annotation.dart';

part 'basket_item_model.g.dart';

@JsonSerializable()
class BasketItemModel {
  final int? id;
  final String? name;
  final String? image_url;
  final int? price;
  final int? quantity;
  final int? weight;

  BasketItemModel(
      {required this.id,
      required this.name,
      required this.image_url,
      required this.price,
      required this.quantity,
      required this.weight});

  factory BasketItemModel.fromJson(Object? json) =>
      _$BasketItemModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BasketItemModelToJson(this);
}
