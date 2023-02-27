import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final Widget child;
  final String itemCount;
  final Color color;
  const BadgeWidget({
    Key key,
    @required this.child,
    @required this.itemCount,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color != null
                  ? color
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              itemCount,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
