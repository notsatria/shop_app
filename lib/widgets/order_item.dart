import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({Key key, this.orderItem}) : super(key: key);

  final OrderItem orderItem;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  _expanded = (!_expanded);
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.orderItem.products.length * 20.0 + 10, 100),
              child: ListView(
                  children: widget.orderItem.products
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '${item.quantity} x \$${item.price}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList()),
            ),
        ],
      ),
    );
  }
}
