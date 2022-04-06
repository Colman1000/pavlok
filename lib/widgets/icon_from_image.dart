import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconFromImage extends StatelessWidget {
  const IconFromImage(
    this.icon, {
    Key? key,
    this.size = 20,
    this.fit = BoxFit.cover,
    this.color,
  }) : super(key: key);

  final String icon;
  final double size;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final _theme = Get.theme;

    return SizedBox(
      child: Image.asset(
        icon,
        filterQuality: FilterQuality.medium,
        fit: BoxFit.fitWidth,
        color: color ?? _theme.disabledColor,
      ),
      height: size,
      width: size,
    );
  }
}
