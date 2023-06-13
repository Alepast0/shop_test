import 'package:json_annotation/json_annotation.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int? id;
  final String? name;
  final int? price;
  final int? weight;
  final String? description;
  final String? image_url;
  final List<String>? tegs;

  ItemModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.weight,
      required this.description,
      required this.image_url,
      required this.tegs});

  factory ItemModel.fromJson(Object? json) => _$ItemModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
