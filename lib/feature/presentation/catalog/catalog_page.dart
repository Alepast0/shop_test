import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/feature/domain/entities/item_entities/item_entities.dart';
import 'package:shop_test/feature/domain/repositories/items_repositury.dart';
import 'package:shop_test/feature/presentation/catalog/catalog_cubit.dart';
import 'package:shop_test/feature/ui/bottombar.dart';
import 'package:shop_test/feature/ui/item/catalog_widget.dart';

class CatalogPage extends StatelessWidget {
  final String? title;

  const CatalogPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogCubit(context.read<ItemsRepository>()),
      child: _CatalogPage(
        title: title,
      ),
    );
  }
}

class _CatalogPage extends StatefulWidget {
  final String? title;

  const _CatalogPage({Key? key, required this.title}) : super(key: key);

  @override
  State<_CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<_CatalogPage> {
  @override
  void initState() {
    context.read<CatalogCubit>().fetchCatalog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 101,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 68),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 63),
                    child: Text(
                      widget.title!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 51),
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: Image.asset("assets/images/user.png"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: SizedBox(
                height: 35,
                child: ListView.separated(
                  itemCount: context.read<CatalogCubit>().tags.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    bool isSelected = index == context.read<CatalogCubit>().selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<CatalogCubit>().updateSelectedIndex(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isSelected
                              ? const Color.fromRGBO(51, 100, 224, 1)
                              : const Color.fromRGBO(248, 247, 245, 1),
                        ),
                        child: Center(
                          child: Text(
                            context.read<CatalogCubit>().tags[index],
                            style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CatalogCubit, CatalogState>(
                builder: (context, state) {
                  if (state is CatalogLoadSuccess) {
                    List<ItemEntities> sortedItems = state.listItemEntities!.products
                        .where((element) =>
                            element.tegs!.contains(context.read<CatalogCubit>().selectedTag))
                        .toList();
                    return GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 13,
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      children: List.generate(
                        sortedItems.length,
                        (index) {
                          return CatalogWidget(
                            item: sortedItems[index],
                          );
                        },
                      ),
                    );
                  }
                  if (state is ErrorState) {
                    return const Text('Error');
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(activePageIndex: -1),
    );
  }
}
