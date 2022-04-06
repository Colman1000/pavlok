import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/assets.dart';
import 'package:pavlok/config/colors.dart';

class RadialTimer extends StatelessWidget {
  RadialTimer({Key? key}) : super(key: key);

  final _ = RadialTimerController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              child: CustomPaint(
                painter: _RadialTimerPainter(),
              ),
            ),
          ),
          if (false)
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Image.asset(Assets.clock),
                ),
              ),
            ),
          if (false)
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '11Hrs',
                    style: GoogleFonts.manrope(
                      fontSize: 21.73,
                      fontWeight: FontWeight.w800,
                      color: PavlokColors.primaryDark,
                    ),
                  ),
                  Text(
                    '00min',
                    style: GoogleFonts.manrope(
                      fontSize: 11.7,
                      fontWeight: FontWeight.w600,
                      color: PavlokColors.black,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RadialTimerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    const dialStrokeWidth = 30.0;
    const clockFaceShadowElevation = 30.0;
    const halfDialStrokeWidth = dialStrokeWidth / 2;

    final side = size.width;
    final radius = side / 2;
    final center = Offset(radius, radius);

    final backCircleFill = Paint()
      ..color = PavlokColors.primaryLight
      ..style = PaintingStyle.fill;

    final clockFaceFill = Paint()
      ..color = PavlokColors.bgColor
      ..style = PaintingStyle.fill;

    final stroke = Paint()
      ..strokeWidth = dialStrokeWidth
      ..strokeCap = StrokeCap.round
      ..color = PavlokColors.primaryDark
      ..shader = const LinearGradient(
        colors: [
          PavlokColors.primary,
          PavlokColors.primaryShade,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(rect)
      ..style = PaintingStyle.stroke;

    final angles = Angles(0, 90);

    canvas.drawCircle(center, radius + halfDialStrokeWidth, backCircleFill);
    canvas.drawShadow(
      Path()
        ..addOval(
          Rect.fromCenter(
            center: Offset(radius, radius - clockFaceShadowElevation),
            width: side,
            height: side,
          ),
        ),
      PavlokColors.primary.withOpacity(0.21),
      clockFaceShadowElevation,
      true,
    );
    canvas.drawCircle(center, radius - halfDialStrokeWidth, clockFaceFill);
    canvas.drawArc(rect, angles.start, angles.sweep, false, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
    // return false;
  }
}

class Angles {
  Angles(double start, double end)
      : start = _getAngleInRads(start),
        end = _getAngleInRads(end);

  double get sweep => end - start;

  late double start, end;

  static double _getAngleInRads(double angle) {
    return (angle - 90) * (math.pi / 180);
  }

  @override
  String toString() {
    return 'Angles{start: ${start}rad, end: ${end.toStringAsFixed(2)}rad, sweepAngle: ${sweep.toStringAsFixed(2)}rad}';
  }
}

class RadialTimerController extends GetxController {}
