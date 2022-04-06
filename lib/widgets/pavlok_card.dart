import 'package:flutter/material.dart';
import 'package:pavlok/config/colors.dart';

class PavlokCard extends StatelessWidget {
  const PavlokCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: PavlokColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: PavlokColors.lightText.withOpacity(0.07),
            blurRadius: 40,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );
  }
}
