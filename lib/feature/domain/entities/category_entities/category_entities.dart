import 'package:equatable/equatable.dart';

class CategoryItemEntities extends Equatable{
  final int? id;
  final String? name;
  final String? image_url;

  const CategoryItemEntities({required this.id, required this.name, required this.image_url});

  @override
  List<Object?> get props => [id, name, image_url];
}