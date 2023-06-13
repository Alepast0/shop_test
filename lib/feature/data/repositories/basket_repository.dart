import 'package:hive/hive.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';
import 'package:shop_test/feature/domain/repositories/basket_repository.dart';

class BasketRequestFailure implements Exception {}

class BasketRepositoryImpl extends BasketRepository {
  final Box<BasketItemModel> _basketBox;

  BasketRepositoryImpl(this._basketBox);

  @override
  Future<void> addToBasket({required BasketItemModel item}) async {
    try {
      await _basketBox.put(item.id, item);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> changeQuantity({required int id, required int quantity}) async {
    try {
      final item = _basketBox.get(id);
      if (item != null) {
        final updatedItem = BasketItemModel(
          id: item.id,
          name: item.name,
          image_url: item.image_url,
          price: item.price,
          quantity: quantity,
          weight: item.weight,
        );
        if (quantity > 0) {
          await _basketBox.put(id, updatedItem);
        } else {
          await _basketBox.delete(id);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<BasketItemModel>> getBasket() async {
    try {
      return _basketBox.values.toList();
    } catch (e) {
      return [];
    }
  }
}
