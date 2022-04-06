import 'package:flutter/material.dart';
import 'package:pavlok/config/colors.dart';

class PavlokIcon extends StatelessWidget {
  const PavlokIcon({Key? key, this.icon, this.image})
      : assert(
          icon != null || image != null,
          'either icon or image must be provided',
        ),
        super(key: key);

  final IconData? icon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: PavlokColors.primaryBG,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 40,
          width: 40,
          child: icon != null
              ? Icon(
                  icon,
                  color: PavlokColors.primary,
                  size: 35,
                )
              : Image.asset(
                  image!,
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
