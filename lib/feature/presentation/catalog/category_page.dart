import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/domain/repositories/items_repositury.dart';
import 'package:shop_test/feature/presentation/catalog/catalog_cubit.dart';
import 'package:shop_test/feature/ui/appbar.dart';
import 'package:shop_test/feature/ui/bottombar.dart';
import 'package:shop_test/feature/ui/item/category_widget.dart';

class CategoryPage extends StatelessWidget {
  final int currentPageIndex;

  const CategoryPage({Key? key, required this.currentPageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogCubit(context.read<ItemsRepository>()),
      child: _CategoryPage(
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}

class _CategoryPage extends StatefulWidget {
  final int currentPageIndex;

  const _CategoryPage({Key? key, required this.currentPageIndex}) : super(key: key);

  @override
  State<_CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<_CategoryPage> {
  @override
  void initState() {
    context.read<CatalogCubit>().fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const CustomBar(),
            Expanded(
              child: BlocBuilder<CatalogCubit, CatalogState>(builder: (context, state) {
                if (state is CategoryLoadSuccess) {
                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, index) {
                        return CategoryWidget(
                          category: state.categoryListItemEntities!.categories[index],
                        );
                      },
                      itemCount: state.categoryListItemEntities!.categories.length);
                }
                if (state is ErrorState) {
                  return const Text('Error');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(activePageIndex: widget.currentPageIndex),
    );
  }
}
