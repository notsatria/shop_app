import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool favoriteItems;
  const ProductsGrid({Key key, this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        favoriteItems ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: const ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl,
              ),
        );
      },
    );
  }
}
