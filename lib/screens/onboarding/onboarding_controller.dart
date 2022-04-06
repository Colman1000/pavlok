import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pavlok/models/habit_data.dart';
import 'package:pavlok/screens/onboarding/widgets/time_selector.dart';

class OnBoardingController extends GetxController {
  late final HabitData habitData;
  late final FixedExtentScrollController wheelController;

  final wheelChildrenExtent = 60.0;
  final wheelMagnification = 1.1;

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<int> intervals = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];

  final selectedDays = RxList<String>();

  void toggleDay(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }

  final selectedInterval = Rx<int>(5);

  void openTimePicker(context) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: Get.height * 0.6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      elevation: 2,
      builder: (_) => const TimeSelector(),
    );
    wheelController.jumpToItem(intervals.indexOf(selectedInterval.value));
  }

  setSelectedIntervalValue(int index) {
    selectedInterval.value = intervals[index];
  }

  void saveInterval() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    habitData = Get.arguments as HabitData;
    wheelController = FixedExtentScrollController(
      initialItem: intervals.indexOf(selectedInterval.value),
    );
  }

  @override
  void onClose() {
    wheelController.dispose();
    super.onClose();
  }
}
