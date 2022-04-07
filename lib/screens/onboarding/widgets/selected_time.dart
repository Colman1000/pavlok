import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';

class SelectedTime extends StatelessWidget {
  const SelectedTime({Key? key, this.hr = 0, this.min = 0}) : super(key: key);

  final num hr, min;

  String get hrString {
    if (hr == 0) {
      return '12';
    } else if (hr > 12) {
      return '${hr - 12}';
    } else {
      return '$hr';
    }
  }

  String get minString {
    if (min > 0) {
      return '30';
    } else {
      return '00';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${hrString}Hrs',
          style: GoogleFonts.manrope(
            fontSize: 21.73,
            fontWeight: FontWeight.w800,
            color: PavlokColors.primaryDark,
          ),
        ),
        Text(
          '${minString}min',
          style: GoogleFonts.manrope(
            fontSize: 11.7,
            fontWeight: FontWeight.w600,
            color: PavlokColors.black,
          ),
        ),
      ],
    );
  }
}
