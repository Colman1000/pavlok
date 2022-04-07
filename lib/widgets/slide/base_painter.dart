import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pavlok/config/colors.dart';

import 'utils.dart';

class BasePainter extends CustomPainter {
  Color baseColor;
  Color selectionColor;
  int primarySectors;
  int secondarySectors;
  double sliderStrokeWidth;
  double clockFaceShadowElevation;

  late Offset center;
  late double radius;

  BasePainter({
    required this.baseColor,
    required this.selectionColor,
    required this.primarySectors,
    required this.secondarySectors,
    required this.sliderStrokeWidth,
    this.clockFaceShadowElevation = 30.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint base = _getPaint(color: baseColor);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) /*- sliderStrokeWidth*/;
    // we need this in the parent to calculate if the user clicks on the circumference

    assert(radius > 0);

    /// draw the outer circle base
    canvas.drawCircle(center, radius, base);

    final clockFaceFill = Paint()
      ..color = PavlokColors.bgColor
      ..style = PaintingStyle.fill;

    // canvas.drawPath(
    //   Path()
    //     ..addOval(
    //       Rect.fromCenter(
    //         center: Offset(
    //           radius + clockFaceShadowElevation + sliderStrokeWidth,
    //           radius,
    //         ),
    //         width: radius * 2,
    //         height: radius * 2,
    //       ),
    //     ),
    //   Paint()
    //     ..color = PavlokColors.primary.withOpacity(0.21).withAlpha(10.toInt())
    //     ..maskFilter = MaskFilter.blur(
    //       BlurStyle.inner,
    //       convertRadiusToSigma(clockFaceShadowElevation * 5),
    //     ),
    // );

    // canvas.drawPath(
    //   Path()
    //     ..addOval(
    //       Rect.fromCenter(
    //         center: Offset(radius, radius),
    //         width: radius * 2,
    //         height: radius * 2,
    //       ),
    //     ),
    //   Paint()
    //     ..color = PavlokColors.primary.withAlpha(10.toInt())
    //     ..maskFilter = MaskFilter.blur(
    //       BlurStyle.normal,
    //       convertRadiusToSigma(clockFaceShadowElevation),
    //     ),
    // );

    canvas.drawShadow(
      Path()
        ..addOval(
          Rect.fromCenter(
            center: Offset(
              radius,
              radius - clockFaceShadowElevation,
            ),
            width: radius * 2,
            height: radius * 2,
          ),
        ),
      PavlokColors.primary.withOpacity(0.21),
      clockFaceShadowElevation,
      true,
    );

    canvas.drawCircle(center, radius - sliderStrokeWidth / 2, clockFaceFill);

    if (primarySectors > 0) {
      _paintSectors(primarySectors, 8.0, selectionColor, canvas);
    }

    if (secondarySectors > 0) {
      _paintSectors(secondarySectors, 6.0, baseColor, canvas);
    }
  }

  void _paintSectors(
      int sectors, double radiusPadding, Color color, Canvas canvas) {
    Paint section = _getPaint(color: color, width: 2.0);

    var endSectors =
        getSectionsCoordinatesInCircle(center, radius + radiusPadding, sectors);
    var initSectors =
        getSectionsCoordinatesInCircle(center, radius - radiusPadding, sectors);
    _paintLines(canvas, initSectors, endSectors, section);
  }

  void _paintLines(
      Canvas canvas, List<Offset> inits, List<Offset> ends, Paint section) {
    assert(inits.length == ends.length && inits.length > 0);

    for (var i = 0; i < inits.length; i++) {
      canvas.drawLine(inits[i], ends[i], section);
    }
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? sliderStrokeWidth;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
