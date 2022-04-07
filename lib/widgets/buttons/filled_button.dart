import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/utils/helpers.dart';

class ButtonFilled extends StatelessWidget {
  const ButtonFilled(
    this.label, {
    Key? key,
    this.onPressed,
    this.color,
    this.disabled = false,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final bool disabled;

  final _rad = const BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    final _textTheme = Get.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity - 48),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _rad,
            gradient: disabled
                ? null
                : const LinearGradient(
                    colors: [
                      PavlokColors.primary,
                      PavlokColors.primaryShade,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
            boxShadow: [
              if (!disabled) ...[
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
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: _rad,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 200,
                spreadRadius: 5,
                offset: const Offset(3, 1),
                color: const Color(0xFFFFFFFF).withAlpha(50),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: _rad,
            onTap: disabled
                ? null
                : onPressed == null
                    ? () {}
                    : () => Helpers.tap(onPressed),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: disabled ? PavlokColors.grey : PavlokColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
