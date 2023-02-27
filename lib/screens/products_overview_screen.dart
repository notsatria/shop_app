import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum SelectPopUpValue {
  favorite,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverviewScreen> {
  var _isFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        actions: [
          PopupMenuButton(
              onSelected: (SelectPopUpValue selectedValue) {
                setState(() {
                  if (selectedValue == SelectPopUpValue.favorite) {
                    _isFavoritesOnly = true;
                  } else {
                    _isFavoritesOnly = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      onTap: () {
                        //
                      },
                      value: SelectPopUpValue.favorite,
                      child: const Text('Favorites only'),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        //
                      },
                      value: SelectPopUpValue.all,
                      child: const Text('Show All'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (ctx, cart, ch) => BadgeWidget(
              itemCount: '${cart.itemCount}',
              child: ch,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(favoriteItems: _isFavoritesOnly),
    );
  }
}
