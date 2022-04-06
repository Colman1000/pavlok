import 'package:flutter/material.dart';
import 'package:pavlok/config/colors.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(this.label, {Key? key, this.onPressed, this.color})
      : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
      ),
      style: TextButton.styleFrom(
          primary: color ?? PavlokColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
    );
  }
}
