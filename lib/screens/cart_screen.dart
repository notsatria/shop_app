import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../providers/order.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '\$${cartItem.totalPriceCart}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cartItem.items.values.toList(),
                            cartItem.totalPriceCart);
                        cartItem.clear();
                      },
                      child: Text(
                        'ORDER NOW!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItem.items.length,
              itemBuilder: (ctx, index) => CartItem(
                id: cartItem.items.values.toList()[index].id,
                productId: cartItem.items.keys.toList()[index],
                title: cartItem.items.values.toList()[index].title,
                price: cartItem.items.values.toList()[index].price,
                quantity: cartItem.items.values.toList()[index].quantity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
