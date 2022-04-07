import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Progress;
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/assets.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/config/intl.dart';
import 'package:pavlok/screens/home/home_controller.dart';
import 'package:pavlok/screens/home/widgets/bad_habits.dart';
import 'package:pavlok/screens/home/widgets/good_habits.dart';
import 'package:pavlok/screens/home/widgets/tab_child.dart';
import 'package:pavlok/widgets/buttons/filled_button.dart';
import 'package:pavlok/widgets/progress.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String name = '/';

  @override
  Widget build(BuildContext context) {
    final _textTheme = Get.textTheme;

    final _ = Get.find<HomeController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 55),
            const Progress(total: 4, completed: 1),
            const SizedBox(height: 32),
            Text(
              Intl.mainGoal.tr,
              style: GoogleFonts.manrope(
                  color: PavlokColors.primaryText,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 9),
            Text(
              Intl.startWithThese.tr,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: PavlokColors.primaryText,
              ),
            ),
            const SizedBox(height: 40),
            TabBar(
              controller: _.tabController,
              tabs: [
                Tab(
                  child: Obx(
                    () => TabChild(
                      icon: Assets.leaf,
                      label: Intl.startGoodHabit.tr,
                      isSelected: _.selectedHabitTab.value == 0,
                    ),
                  ),
                ),
                Tab(
                  child: Obx(
                    () => TabChild(
                      icon: Assets.power,
                      label: Intl.breakBadHabit.tr,
                      isSelected: _.selectedHabitTab.value == 1,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 200),
                  reverse: _.selectedHabitTab.value == 0,
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                  ) {
                    return SharedAxisTransition(
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: _.selectedHabitTab.value == 0
                      ? const GoodHabits()
                      : const BadHabits(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => ButtonFilled(
                'Next',
                disabled: _.selectedHabit.value == null,
                onPressed: _.nextPage,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
