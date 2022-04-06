import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/screens/onboarding/onboarding_controller.dart';
import 'package:pavlok/widgets/buttons/filled_button.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<OnBoardingController>();

    final _overlay = IgnorePointer(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: _.wheelChildrenExtent * _.wheelMagnification,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.tertiarySystemFill,
                    context,
                  ),
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.tertiarySystemFill,
                    context,
                  ),
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Column(
      children: [
        const _HeaderIcon(),
        Text(
          'Reminder',
          style: GoogleFonts.manrope(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: PavlokColors.primaryText,
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _.wheelController,
                        physics: const FixedExtentScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            final num = _.intervals[index].toString();
                            return Align(
                              child: Text(
                                num,
                                style: GoogleFonts.manrope(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: PavlokColors.primaryText,
                                ),
                              ),
                            );
                          },
                          childCount: _.intervals.length,
                        ),
                        onSelectedItemChanged: _.setSelectedIntervalValue,
                        itemExtent: _.wheelChildrenExtent,
                        magnification: _.wheelMagnification,
                        useMagnifier: true,
                        overAndUnderCenterOpacity: 0.4,
                        diameterRatio: 10,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'min',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: PavlokColors.primaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _overlay,
            ],
          ),
        ),
        const SizedBox(height: 32),
        ButtonFilled('Done', onPressed: _.saveInterval),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            color: PavlokColors.greyBG,
            borderRadius: BorderRadius.circular(96),
          ),
          height: 4,
          width: 30,
        ),
      ),
    );
  }
}
