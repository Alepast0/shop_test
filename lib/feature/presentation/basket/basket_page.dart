import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/domain/repositories/basket_repository.dart';
import 'package:shop_test/feature/presentation/basket/basket_cubit.dart';
import 'package:shop_test/feature/presentation/catalog/catalog_cubit.dart';
import 'package:shop_test/feature/ui/appbar.dart';
import 'package:shop_test/feature/ui/basket.dart';
import 'package:shop_test/feature/ui/bottombar.dart';

class BasketPage extends StatelessWidget {
  final int currentPageIndex;

  const BasketPage({Key? key, required this.currentPageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasketCubit(context.read<BasketRepository>()),
      child: _BasketPage(
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}

class _BasketPage extends StatefulWidget {
  final int currentPageIndex;

  const _BasketPage({Key? key, required this.currentPageIndex}) : super(key: key);

  @override
  State<_BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<_BasketPage> {
  @override
  void initState() {
    context.read<BasketCubit>().getBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 16),
        child: Column(
          children: [
            const CustomBar(),
            Expanded(
              child: BlocConsumer<BasketCubit, BasketState>(listener: (context, state) {
                if (state is BasketLoadSuccess) {
                  setState(() {});
                } else if (state is BasketEmpty) {
                  setState(() {});
                }
              }, builder: (context, state) {
                if (state is BasketLoadSuccess) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemBuilder: (BuildContext context, index) {
                      return BasketItem(item: state.loadedBasket[index]!);
                    },
                    itemCount: state.loadedBasket.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 17,
                      );
                    },
                  );
                }
                if (state is ErrorState) {
                  return const Text('Ошибка загрузки');
                }
                if (state is BasketEmpty) {
                  return const Text(
                    'Тут пока пусто=)',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(51, 100, 224, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Оплатить ${context.read<BasketCubit>().calculateTotalCost().toInt()} ₽",
                  style: const TextStyle(
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
      bottomNavigationBar: BottomBar(activePageIndex: widget.currentPageIndex),
    );
  }
}
