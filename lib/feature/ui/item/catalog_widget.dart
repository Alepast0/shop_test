import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/domain/entities/item_entities/item_entities.dart';
import 'package:shop_test/feature/domain/repositories/basket_repository.dart';
import 'package:shop_test/feature/presentation/basket/basket_cubit.dart';
import 'package:shop_test/feature/ui/item/item_widget.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({Key? key, required this.item}) : super(key: key);
  final ItemEntities item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return BlocProvider<BasketCubit>(
                  create: (BuildContext context) => BasketCubit(context.read<BasketRepository>()),
                  child: ItemWidget(item: item));
            });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 109,
                width: 115,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 247, 245, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  item.image_url!,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '${item.name}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
