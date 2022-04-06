import 'package:get/get.dart';

class Intl extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        appName: 'Pavlok',
        appDescription:
            'Powered by apps and wearables that enable members to improve their lives.',
        mainGoal: "What's your main goal?",
        startWithThese: "Let's start with these habits",
        startGoodHabit: "Start a good habit",
        breakBadHabit: "Break a bad habit",
      },
    };
  }

  static const String appName = 'appName';
  static const String appDescription = 'appDescription';

  static const String mainGoal = 'mainGoal';
  static const String startWithThese = 'startWithThese';
  static const String startGoodHabit = 'startGoodHabit';
  static const String breakBadHabit = 'breakBadHabit';
}
