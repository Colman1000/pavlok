import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/widgets/icon_from_image.dart';

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({
    Key? key,
    required this.label,
    required this.image,
    required this.value,
    required this.color,
  }) : super(key: key);

  final String label, image, value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: IconFromImage(
            image,
            fit: BoxFit.fitWidth,
            color: color,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: PavlokColors.secondaryText,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: PavlokColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
