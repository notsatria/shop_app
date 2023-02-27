import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Baju',
      description: 'Baju polos biasa',
      price: 10,
      imageUrl:
          'https://i.pinimg.com/564x/87/06/c1/8706c1882736f5022c8975a45385f717.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Celana',
      description: 'Celana keren',
      price: 30,
      imageUrl:
          'https://i.pinimg.com/564x/e6/80/20/e6802063996e159daaf80fa5a271e4e2.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Tas',
      description: 'Tas perempuan keren lucu',
      price: 50,
      imageUrl:
          'https://i.pinimg.com/564x/dd/54/66/dd5466ba68bce62db601d4c60ee4ebe5.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Sepatu',
      description: 'Sepatu keren',
      price: 100,
      imageUrl:
          'https://i.pinimg.com/564x/1b/5e/42/1b5e42548192cadd934654c80f23f5eb.jpg',
    ),
  ];

  // var _showFavoriteOnly = false;

  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((item) => item.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
