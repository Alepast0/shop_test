import 'package:json_annotation/json_annotation.dart';

part 'category_items_model.g.dart';

@JsonSerializable()
class CategoryItemModel {
  final int? id;
  final String? name;
  final String? image_url;

  CategoryItemModel({required this.id, required this.name, required this.image_url});

  factory CategoryItemModel.fromJson(Object? json) =>
      _$CategoryItemModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}
