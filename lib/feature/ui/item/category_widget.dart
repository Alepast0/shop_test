import 'package:flutter/material.dart';
import 'package:shop_test/feature/domain/entities/category_entities/category_entities.dart';
import 'package:shop_test/feature/presentation/catalog/catalog_page.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.category}) : super(key: key);
  final CategoryItemEntities category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CatalogPage(
                  title: category.name,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Stack(children: [
          Image.network(
            category.image_url!,
            fit: BoxFit.fill,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 12, left: 16),
              child: SizedBox(
                width: 191,
                child: Text(
                  '${category.name}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  softWrap: true,
                ),
              )),
        ]),
      ),
    );
  }
}
