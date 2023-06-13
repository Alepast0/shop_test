import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/data/models/basket/basket_item_model.dart';
import 'package:shop_test/feature/presentation/basket/basket_cubit.dart';

class BasketItem extends StatelessWidget {
  final BasketItemModel item;

  const BasketItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 62,
                width: 62,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(248, 247, 245, 1),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    Image.network(item.image_url!)
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 62,
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name!,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                      softWrap: true,
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
                  ],
                ),
              )
            ],
          ),
          Container(
            width: 99,
            height: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(239, 238, 236, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const SizedBox(
                    width: 33,
                    child: Center(
                      child: Text(
                        "—",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                  ),
                  onTap: () {
                    context
                        .read<BasketCubit>()
                        .changeQuantity(id: item.id!, quantity: item.quantity!, increase: false);
                    context.read<BasketCubit>().getBasket();
                  },
                ),
                SizedBox(
                  width: 33,
                  child: Center(
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                ),
                GestureDetector(
                  child: const SizedBox(
                    width: 33,
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                  ),
                  onTap: () {
                    context
                        .read<BasketCubit>()
                        .changeQuantity(id: item.id!, quantity: item.quantity!, increase: true);
                    context.read<BasketCubit>().getBasket();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
