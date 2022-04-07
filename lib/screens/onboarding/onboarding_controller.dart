import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pavlok/config/assets.dart';
import 'package:pavlok/models/clock_images.dart';
import 'package:pavlok/models/habit_data.dart';
import 'package:pavlok/screens/onboarding/widgets/time_selector.dart';
import 'package:pavlok/utils/helpers.dart';

class OnBoardingController extends GetxController {
  late final HabitData habitData;
  late final FixedExtentScrollController wheelController;

  final int timeGoal = 8;

  final wheelChildrenExtent = 50.0;
  final wheelMagnification = 1.1;

  final totalClockSegments = 48;

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

  final _start = Rx<int>(0);
  final _end = Rx<int>(4);

  String get startTime => '';

  String get endTime => '';

  num get startTimeNum => mapIntToTimeInt(_start.value);

  num get endTimeNum => mapIntToTimeInt(_end.value);

  num get totalTimeNumDifference => (endTimeNum - startTimeNum).abs();

  num get timeDifferenceHour => totalTimeNumDifference.floor();

  num get timeDifferenceMin =>
      totalTimeNumDifference > timeDifferenceHour ? 30 : 0;

  String get sliderTip => totalTimeNumDifference > timeGoal
      ? 'Over your ${habitData.inscription} goal ( ${timeGoal}hrs )'
      : 'Under your ${habitData.inscription} goal ( ${timeGoal}hrs )';

  int get start => _start.value;

  int get end => _end.value;

  void onTimeChanged(int start, int end, int _) {
    _start.value = start;
    _end.value = end;
  }

  void toggleDay(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }

  final selectedInterval = Rx<int>(5);

  void openTimePicker(context) {
    Helpers.tap(() {});
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

  num mapIntToTimeInt(int value) {
    if (value.isOdd) {
      /// 30 mins added to time
      return (((value - 1) / totalClockSegments) * 24) + 0.5;
    }
    return (value / totalClockSegments) * 24;
  }

  String mapTimeIntString(num value) {
    return '';
  }

  Future<ClockImages> loadImages() async {
    final _data = await Future.wait([
      decodeImageFromList(
        (await rootBundle.load(Assets.dark)).buffer.asUint8List(),
      ),
      decodeImageFromList(
        (await rootBundle.load(Assets.light)).buffer.asUint8List(),
      ),
    ]);

    return ClockImages(
      dark: _data.first,
      light: _data.last,
    );
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
