import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_test/feature/data/data_source/adapter.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';

class HiveInitializer {
  static Future<void> initializeHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = appDocumentDir.path;
    Hive.init(path);
    Hive.registerAdapter(BasketItemModelAdapter());
    await Hive.openBox<BasketItemModel>('basket');
  }
}
