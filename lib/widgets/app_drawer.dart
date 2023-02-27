import 'package:flutter/material.dart';

import '../screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello, Friend!'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Shop',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: const Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            title: Text('My Orders',
                style: Theme.of(context).textTheme.titleMedium),
            leading: const Icon(Icons.payment),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
