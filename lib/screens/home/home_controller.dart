import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pavlok/config/assets.dart';
import 'package:pavlok/models/habit_data.dart';
import 'package:pavlok/screens/onboarding/onboarding_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final goodHabits = <HabitData>[
    HabitData(
      label: 'Set bedtime and wake up',
      image: Assets.sleep,
      inscription: 'sleep',
      begin: 'Bedtime',
      end: 'Wake up',
    ),
    HabitData(
      label: 'Take a walk',
      image: Assets.walk,
      inscription: 'walk',
      begin: 'Start',
      end: 'End',
    ),
    HabitData(
      label: 'Stay hydrated',
      image: Assets.bottle,
      inscription: 'hydration',
      begin: 'Begin',
      end: 'End',
    ),
    HabitData(
      label: 'Call parents',
      image: Assets.call,
      inscription: 'call',
      begin: 'Start',
      end: 'End',
    ),
    HabitData(
      label: 'Donate to charity',
      image: Assets.donate,
      inscription: 'charity',
      begin: 'Begin',
      end: 'End',
    ),
  ];

  final badHabits = <HabitData>[
    HabitData(
      label: "Can't wake up",
      image: Assets.sleep,
      inscription: 'sleep',
      begin: 'Bedtime',
      end: 'Wake up',
    ),
    HabitData(
      label: 'Getting lazy for workout',
      image: Assets.walk,
      inscription: 'workout',
      begin: 'Start',
      end: 'End',
    ),
    HabitData(
      label: 'Forgetting to drink water',
      image: Assets.bottle,
      inscription: 'hydration',
      begin: 'Begin',
      end: 'End',
    ),
    HabitData(
      label: 'Spending on credit cards',
      image: Assets.donate,
      inscription: 'spending',
      begin: 'Begin',
      end: 'End',
    ),
  ];

  final selectedHabit = Rx<HabitData?>(null);
  final selectedHabitTab = Rx<int>(0);

  void selectHabit(HabitData habit) {
    selectedHabit.value = habit;
  }

  void nextPage() {
    print('next page');
    print(OnBoardingView.name);
    Get.toNamed(OnBoardingView.name, arguments: selectedHabit.value);
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        selectedHabitTab.value = tabController.index;
      });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
