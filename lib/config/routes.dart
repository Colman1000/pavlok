import 'package:get/get.dart';
import 'package:pavlok/screens/home/home.dart';
import 'package:pavlok/screens/onboarding/onboarding.dart';

class Routes {
  static final List<GetPage> all = [home, onBoarding];
  static final String initial = home.name;
}
