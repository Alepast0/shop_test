import 'package:flutter/material.dart';
import 'package:shop_test/development.dart';
import 'package:shop_test/feature/presentation/basket/basket_page.dart';
import 'package:shop_test/feature/presentation/catalog/catalog_page.dart';
import 'package:shop_test/feature/presentation/catalog/category_page.dart';

Future<void> main() async {
  Development().init();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Category',
      routes: {
        '/Category': (context) => const CategoryPage(currentPageIndex: 0),
        '/Basket': (context) => const BasketPage(currentPageIndex: 2),
        '/Catalog': (context) => const CatalogPage(title: ''),
      },
    );
  }
}
