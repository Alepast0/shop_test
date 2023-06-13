import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';

abstract class BasketRepository {
  Future<List<BasketItemModel>> getBasket();

  Future<void> addToBasket({required BasketItemModel item});

  Future<void> changeQuantity({required int id, required int quantity});
}
