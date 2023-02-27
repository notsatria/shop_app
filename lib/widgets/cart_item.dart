import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key,
      @required this.id,
      @required this.productId,
      @required this.title,
      @required this.price,
      @required this.quantity})
      : super(key: key);

  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(productId),
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Are you sure to delete this item(s)?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ));
      },
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        color: Theme.of(context).colorScheme.error,
        child: const Icon(
          Icons.delete,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
