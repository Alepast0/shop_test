import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_list_entities.dart';
import 'package:shop_test/feature/domain/entities/item_entities/Item_list_entities.dart';
import 'package:shop_test/feature/domain/repositories/items_repositury.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends CatalogState {
  const LoadingState();
}

class RefreshCatalog extends CatalogState {}

class InitialLoadingCatalog extends CatalogState {}

class InitialLoadingCategory extends CatalogState {}

class CatalogLoadSuccess extends CatalogState {
  const CatalogLoadSuccess({required this.listItemEntities});

  final ListItemEntities? listItemEntities;

  @override
  List<Object?> get props => [listItemEntities];
}

class CategoryLoadSuccess extends CatalogState {
  const CategoryLoadSuccess({required this.categoryListItemEntities});

  final CategoryListItemEntities? categoryListItemEntities;

  @override
  List<Object?> get props => [categoryListItemEntities];
}

class ErrorState extends CatalogState {
  const ErrorState();
}

class SortItemState extends CatalogState {
  const SortItemState();
}

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._itemsRepository) : super(const LoadingState());
  final ItemsRepository _itemsRepository;
  final List<String> tags = ['Все меню', "Салаты", "С рисом", "С рыбой"];
  int selectedIndex = 0;
  String selectedTag = 'Все меню';

  Future<void> fetchCategory() async {
    emit(InitialLoadingCategory());
    try {
      final categoryResult = await _itemsRepository.getCategory();
      emit(CategoryLoadSuccess(categoryListItemEntities: categoryResult));
    } catch (e, s) {
      emit(const ErrorState());
    }
  }

  Future<void> fetchCatalog() async {
    emit(InitialLoadingCatalog());
    try {
      final catalogResult = await _itemsRepository.getCatalog();
      emit(CatalogLoadSuccess(listItemEntities: catalogResult));
    } catch (e) {
      emit(const ErrorState());
    }
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    selectedTag = tags[index];
    fetchCatalog();
  }
}
