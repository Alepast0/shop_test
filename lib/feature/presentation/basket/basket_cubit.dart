import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';
import 'package:shop_test/feature/domain/repositories/basket_repository.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object?> get props => [];
}

class BasketLoadingState extends BasketState {
  const BasketLoadingState();
}

class PuttingLoadingState extends BasketState {
  const PuttingLoadingState();
}

class StopPuttingLoadingState extends BasketState {
  const StopPuttingLoadingState();
}

class RemovingFromBasketState extends BasketState {
  const RemovingFromBasketState();
}

class StopRemovingFromBasketState extends BasketState {
  const StopRemovingFromBasketState();
}

class ChangeQuantityLoadingState extends BasketState {
  const ChangeQuantityLoadingState();
}

class StopChangeQuantityLoadingState extends BasketState {
  const StopChangeQuantityLoadingState();
}

class BasketEmpty extends BasketState {
  const BasketEmpty();
}

class BasketItemsState extends BasketState {
  const BasketItemsState({required this.productId});

  final int? productId;

  @override
  List<Object?> get props => [productId];
}

class InitialLoadBasket extends BasketState {}

class BasketLoadSuccess extends BasketState {
  const BasketLoadSuccess({required this.loadedBasket});

  final List<BasketItemModel?> loadedBasket;

  @override
  List<Object?> get props => [loadedBasket];
}

class BasketErrorState extends BasketState {
  const BasketErrorState();
}

class ChangeQuantitySuccessState extends BasketState {
  final int quantity;

  const ChangeQuantitySuccessState(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class BasketCubit extends Cubit<BasketState> {
  final BasketRepository _basketRepository;

  BasketCubit(this._basketRepository) : super(InitialLoadBasket());

  Future<void> addToBasket(BasketItemModel item) async {
    try {
      emit(const PuttingLoadingState());
      await _basketRepository.addToBasket(item: item);
      emit(const StopPuttingLoadingState());
    } catch (e) {
      emit(const BasketErrorState());
    }
  }

  Future<void> changeQuantity(
      {required int id, required int quantity, required bool increase}) async {
    try {
      emit(const ChangeQuantityLoadingState());
      final newQuantity = increase ? quantity + 1 : quantity - 1;
      await _basketRepository.changeQuantity(id: id, quantity: newQuantity);
      getBasket();
      emit(const StopChangeQuantityLoadingState());
    } catch (e) {
      emit(const BasketErrorState());
    }
  }

  Future<void> getBasket() async {
    try {
      emit(const BasketLoadingState());
      final basketItems = await _basketRepository.getBasket();
      if (basketItems.isEmpty) {
        emit(const BasketEmpty());
      } else {
        emit(const BasketItemsState(productId: null));
        emit(BasketLoadSuccess(loadedBasket: basketItems));
      }
    } catch (e) {
      emit(const BasketErrorState());
    }
  }

  double calculateTotalCost() {
    if (state is BasketLoadSuccess) {
      double totalCost = 0.0;
      final loadedBasket = (state as BasketLoadSuccess).loadedBasket;
      for (final item in loadedBasket) {
        totalCost += (item!.quantity ?? 0) * item.price!;
      }
      return totalCost;
    } else if (state is BasketEmpty) {
      return 0.0;
    }
    return 0.0;
  }
}
