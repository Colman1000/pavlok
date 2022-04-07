import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/screens/home/home_controller.dart';
import 'package:pavlok/widgets/habit_tile.dart';

class BadHabits extends StatelessWidget {
  const BadHabits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<HomeController>();

    return Container(
      color: PavlokColors.bgColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: _.badHabits
            .map(
              (e) => Obx(
                () => HabitTile(
                  e,
                  isSelected: _.selectedHabit.value == e,
                  onTap: () => _.selectHabit(e),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
