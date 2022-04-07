import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/assets.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/screens/onboarding/onboarding_controller.dart';
import 'package:pavlok/screens/onboarding/widgets/radial_timer.dart';
import 'package:pavlok/screens/onboarding/widgets/repeat_days_select.dart';
import 'package:pavlok/screens/onboarding/widgets/time_display.dart';
import 'package:pavlok/widgets/buttons/filled_button.dart';
import 'package:pavlok/widgets/icon_from_image.dart';
import 'package:pavlok/widgets/time_picker.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  static const String name = '/onboarding';

  @override
  Widget build(BuildContext context) {
    final _textTheme = Get.textTheme;

    final _ = Get.find<OnBoardingController>();

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: BackButton(),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            child: Text(
              _.habitData.label,
              style: GoogleFonts.manrope(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: PavlokColors.black,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: RadialTimer(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IconFromImage(
                Assets.bulb,
                color: PavlokColors.secondary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Obx(
                () => Text(
                  _.sliderTip,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: PavlokColors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 32),
              Expanded(
                child: Obx(
                  () => TimeDisplay(
                    color: PavlokColors.primary,
                    label: 'Bedtime',
                    image: Assets.dark,
                    value: TimeDisplay.parseTime(_.startTimeNum),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => TimeDisplay(
                    color: PavlokColors.secondary,
                    label: 'Wake up',
                    image: Assets.light,
                    value: TimeDisplay.parseTime(_.endTimeNum),
                  ),
                ),
              ),
              const SizedBox(width: 32),
            ],
          ),
          const SizedBox(height: 24),
          RepeatDaysSelect(),
          const SizedBox(height: 16),
          TimePicker(),
          const SizedBox(height: 16),
          ButtonFilled('Next'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
