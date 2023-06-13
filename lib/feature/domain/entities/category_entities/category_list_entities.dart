import 'package:equatable/equatable.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_entities.dart';

class CategoryListItemEntities extends Equatable{
  final List<CategoryItemEntities> categories;

  const CategoryListItemEntities({required this.categories});

  @override
  List<Object?> get props => [categories];
}