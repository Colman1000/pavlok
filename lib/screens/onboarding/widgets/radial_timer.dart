import 'package:async_builder/async_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/models/clock_images.dart';
import 'package:pavlok/screens/onboarding/onboarding_controller.dart';
import 'package:pavlok/screens/onboarding/widgets/clock.dart';
import 'package:pavlok/screens/onboarding/widgets/selected_time.dart';
import 'package:pavlok/widgets/slide/double_circular_slider.dart';

class RadialTimer extends StatelessWidget {
  const RadialTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<OnBoardingController>();

    return Center(
      child: SizedBox(
        height: 220,
        width: 220,
        child: AsyncBuilder<ClockImages>(
          builder: (context, images) => DoubleCircularSlider(
            _.totalClockSegments,
            _.start,
            _.end,
            images: images!,
            onSelectionEnd: _.onTimeChanged,
            sliderStrokeWidth: 30,
            showHandlerOutter: false,
            baseColor: PavlokColors.primaryLight,
            child: Clock(
              child: Obx(
                () => SelectedTime(
                  hr: _.timeDifferenceHour,
                  min: _.timeDifferenceMin,
                ),
              ),
            ),
          ),
          future: _.loadImages(),
          waiting: (context) => const Clock(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}
