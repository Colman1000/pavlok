import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/screens/onboarding/onboarding_controller.dart';
import 'package:pavlok/screens/onboarding/widgets/day_select.dart';
import 'package:pavlok/widgets/pavlok_card.dart';

class RepeatDaysSelect extends StatelessWidget {
  const RepeatDaysSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<OnBoardingController>();

    return PavlokCard(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Repeat days',
              style: GoogleFonts.interTextTheme().bodyText1?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _.days
                  .map(
                    (e) => Obx(
                      () => DaySelect(
                        day: e[0],
                        onTap: () => _.toggleDay(e),
                        isSelected: _.selectedDays.contains(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
