import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/models/clock_images.dart';

import 'circular_slider_painter.dart' show CircularSliderMode;
import 'utils.dart';

class SliderPainter extends CustomPainter {
  CircularSliderMode mode;
  ClockImages images;
  double startAngle;
  double endAngle;
  double sweepAngle;
  Color selectionColor;
  Color handlerColor;
  double handlerOuterRadius;
  bool showRoundedCapInSelection;
  bool showHandlerOuter;
  double sliderStrokeWidth;
  double handlerPad;

  late Offset initHandler;
  late Offset endHandler;
  late Offset center;
  late double radius;

  SliderPainter({
    required this.mode,
    required this.startAngle,
    required this.images,
    required this.endAngle,
    required this.sweepAngle,
    required this.selectionColor,
    required this.handlerColor,
    required this.handlerOuterRadius,
    required this.showRoundedCapInSelection,
    required this.showHandlerOuter,
    required this.sliderStrokeWidth,
    this.handlerPad = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) /*- sliderStrokeWidth*/;

    Paint progress = _getHandlerPaint(Offset.zero & size);

    ///draw progress bar
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + startAngle,
      sweepAngle,
      false,
      progress,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + startAngle,
      sweepAngle,
      false,
      Paint()
        ..strokeCap = StrokeCap.round
        ..color = PavlokColors.white.withAlpha(15)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(30),
        ),
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: center, radius: radius + (sliderStrokeWidth / 2) - 1),
      -pi / 2 + startAngle,
      sweepAngle,
      false,
      Paint()
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = PavlokColors.white
        ..maskFilter = MaskFilter.blur(
          BlurStyle.outer,
          convertRadiusToSigma(5),
        ),
    );

    Paint handler = _getPaint(
        color: handlerColor.withOpacity(0.2), style: PaintingStyle.fill);
    Paint handlerOuter = _getPaint(color: handlerColor, width: 2.0);

    ColorFilter imageFilter = const ColorFilter.mode(
      PavlokColors.light,
      BlendMode.srcATop,
    );

    /// draw handlers
    if (mode == CircularSliderMode.doubleHandler) {
      initHandler = radiansToCoordinates(center, -pi / 2 + startAngle, radius);
      canvas.drawCircle(
          initHandler, (sliderStrokeWidth / 2) - handlerPad, handler);
      if (showHandlerOuter) {
        canvas.drawCircle(initHandler, handlerOuterRadius, handlerOuter);
      }

      //draw dark image
      paintImage(
        canvas: canvas,
        rect: Rect.fromCircle(
          center: Offset(
            initHandler.dx,
            initHandler.dy,
          ),
          radius: images.dark.width / 3,
        ),
        image: images.dark,
        filterQuality: FilterQuality.medium,
        isAntiAlias: true,
        colorFilter: imageFilter,
      );
    }

    endHandler = radiansToCoordinates(center, -pi / 2 + endAngle, radius);
    canvas.drawCircle(
      endHandler,
      (sliderStrokeWidth / 2) - handlerPad,
      handler,
    );
    if (showHandlerOuter) {
      canvas.drawCircle(endHandler, handlerOuterRadius, handlerOuter);
    }

    //draw dark image

    paintImage(
      canvas: canvas,
      rect: Rect.fromCircle(
        center: Offset(
          endHandler.dx,
          endHandler.dy,
        ),
        radius: images.light.width / 3,
      ),
      image: images.light,
      filterQuality: FilterQuality.medium,
      isAntiAlias: true,
      colorFilter: imageFilter,
    );
  }

  Paint _getPaint({
    required Color color,
    double? width,
    PaintingStyle? style,
  }) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = style ?? PaintingStyle.stroke
      ..strokeWidth = width ?? sliderStrokeWidth;
  }

  Paint _getHandlerPaint(Rect rect) {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..color = PavlokColors.primaryDark
      ..shader = const LinearGradient(
        colors: [
          PavlokColors.primary,
          PavlokColors.primaryShade,
        ],
        end: Alignment.bottomLeft,
        begin: Alignment.topRight,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = sliderStrokeWidth;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
