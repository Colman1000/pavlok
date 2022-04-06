import 'package:get/get.dart';
import 'package:pavlok/screens/onboarding/onboarding_bindings.dart';
import 'package:pavlok/screens/onboarding/onboarding_view.dart';

final onBoarding = GetPage(
  name: OnBoardingView.name,
  page: () => const OnBoardingView(),
  binding: OnBoardingBinding(),
);
