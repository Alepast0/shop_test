import 'package:equatable/equatable.dart';

class ItemEntities extends Equatable {
  final int? id;
  final String? name;
  final int? price;
  final int? weight;
  final String? description;
  final String? image_url;
  final List<String>? tegs;

  const ItemEntities(
      {required this.id,
      required this.name,
      required this.price,
      required this.weight,
      required this.description,
      required this.image_url,
      required this.tegs});

  @override
  List<Object?> get props => [id, name, price, weight, description, image_url, tegs];
}
