import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/widgets/icon_from_image.dart';

class TabChild extends StatelessWidget {
  const TabChild({
    Key? key,
    required this.label,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final String label, icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconFromImage(
          icon,
          fit: BoxFit.cover,
          color: isSelected ? PavlokColors.primary : PavlokColors.secondaryText,
          size: 15,
        ),
        const SizedBox(width: 5.5),
        Text(
          label,
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: isSelected
                  ? PavlokColors.primary
                  : PavlokColors.secondaryText),
        ),
      ],
    );
  }
}
