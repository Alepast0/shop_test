import 'package:hive/hive.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';

class BasketItemModelAdapter extends TypeAdapter<BasketItemModel> {
  @override
  final int typeId = 0;

  @override
  BasketItemModel read(BinaryReader reader) {
    return BasketItemModel(
      id: reader.readInt(),
      name: reader.readString(),
      image_url: reader.readString(),
      price: reader.readInt(),
      quantity: reader.readInt(),
      weight: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, BasketItemModel obj) {
    writer.writeInt(obj.id!);
    writer.writeString(obj.name!);
    writer.writeString(obj.image_url!);
    writer.writeInt(obj.price!);
    writer.writeInt(obj.quantity!);
    writer.writeInt(obj.weight!);
  }
}
