import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/screens/onboarding/onboarding_controller.dart';
import 'package:pavlok/widgets/pavlok_card.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<OnBoardingController>();

    return PavlokCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _.openTimePicker(context),
        child: Row(
          children: [
            Text(
              'Remind me before bedtime',
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PavlokColors.black,
              ),
            ),
            const Spacer(),
            Obx(
              () => Text(
                '${_.selectedInterval.value} min',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: PavlokColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
