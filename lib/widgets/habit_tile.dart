import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/models/habit_data.dart';
import 'package:pavlok/utils/helpers.dart';
import 'package:pavlok/widgets/pavlok_icon.dart';

class HabitTile extends StatelessWidget {
  const HabitTile(this.habit, {Key? key, this.isSelected = false, this.onTap})
      : super(key: key);

  final bool isSelected;
  final HabitData habit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Get.textTheme;

    final _rad = BorderRadius.circular(16.0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: _rad,
            color: isSelected ? PavlokColors.primaryBG : PavlokColors.white,
            boxShadow: [
              if (!isSelected)
                BoxShadow(
                  color: const Color(0xFF18274B).withOpacity(0.07),
                  blurRadius: 40,
                  offset: const Offset(0, 14),
                ),
            ]),
        child: InkWell(
          onTap: onTap == null ? () {} : () => Helpers.tap(onTap),
          borderRadius: _rad,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                PavlokIcon(
                  image: habit.image,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    habit.label,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? PavlokColors.primaryDark
                          : PavlokColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
