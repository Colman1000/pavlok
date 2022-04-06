import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key? key,
    required this.total,
    this.completed = 0,
    this.height = 7,
  }) : super(key: key);
  final int total;
  final int completed;
  final double height;

  double get progress => completed / total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                const _Bar(),
                _Bar(color: PavlokColors.secondary, progress: progress),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              '$completed of $total',
              style: GoogleFonts.manrope(
                color: PavlokColors.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    Key? key,
    this.color = PavlokColors.greyBG,
    this.height = 7,
    this.progress = 1,
  }) : super(key: key);

  final Color color;
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: color,
        ),
        width: constraints.maxWidth * progress,
        height: height,
      ),
    );
  }
}
