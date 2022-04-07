import 'package:flutter/material.dart';
import 'package:pavlok/config/assets.dart';

class Clock extends StatelessWidget {
  const Clock({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              Assets.clock,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (child != null)
          Center(
            child: child,
          )
      ],
    );
  }
}
