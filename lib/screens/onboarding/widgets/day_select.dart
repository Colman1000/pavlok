import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/utils/helpers.dart';
import 'package:pavlok/widgets/inner_shadow.dart';

class DaySelect extends StatelessWidget {
  const DaySelect({
    Key? key,
    required this.day,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String day;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : () => Helpers.tap(onTap),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Stack(
          children: [
            ClipOval(
              child: InnerShadow(
                shadow: isSelected
                    ? BoxShadow(
                        blurStyle: BlurStyle.inner,
                        blurRadius: 15,
                        offset: const Offset(3, 1),
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                      )
                    : const BoxShadow(
                        color: Colors.transparent,
                      ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [
                              PavlokColors.primary,
                              PavlokColors.primaryShade,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        : null,
                    boxShadow: [
                      if (isSelected) ...[
                        const BoxShadow(
                          blurRadius: 20,
                          offset: Offset(0, 8),
                          color: Color(0xFFBDACFB),
                        ),
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          blurRadius: 15,
                          offset: const Offset(3, 1),
                          color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        ),
                        // BoxShadow(
                        //   blurStyle: BlurStyle.inner,
                        //   blurRadius: 10,
                        //   offset: const Offset(0, -3),
                        //   color: const Color(0xFF000000).withOpacity(0.37),
                        // ),
                      ]
                    ],
                    color: isSelected ? null : PavlokColors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Align(
              child: Text(
                day,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isSelected ? PavlokColors.white : PavlokColors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
