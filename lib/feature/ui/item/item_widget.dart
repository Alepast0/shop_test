import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';
import 'package:shop_test/feature/domain/entities/item_entities/item_entities.dart';
import 'package:shop_test/feature/presentation/basket/basket_cubit.dart';

class ItemWidget extends StatelessWidget {
  final ItemEntities item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 232,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromRGBO(248, 247, 245, 1),
                            ),
                          ),
                          Image.network(item.image_url!),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), color: Colors.white),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 56,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), color: Colors.white),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      item.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${item.price} ₽',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' · ${item.weight}г',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      item.description!,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.65),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final basketItem = BasketItemModel(
                              id: item.id,
                              name: item.name,
                              image_url: item.image_url,
                              quantity: 1,
                              price: item.price,
                              weight: item.weight);
                          context.read<BasketCubit>().addToBasket(basketItem);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(51, 100, 224, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Добавить в корзину",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
