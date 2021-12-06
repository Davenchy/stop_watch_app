import 'dart:math';

import 'package:flutter/material.dart';
import 'clock_digits.dart';

import '../controllers/stop_watch_controller.dart';
import 'clock_hand.dart';
import 'clock_piece.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({
    Key? key,
    required this.controller,
    this.backgroundColor = Colors.black87,
    this.secondsColor = Colors.grey,
    this.specialSecondsColor = Colors.blue,
    this.secondsHandColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  final StopWatchController controller;

  final Color backgroundColor;
  final Color secondsColor;
  final Color specialSecondsColor;
  final Color secondsHandColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, box) {
          final double clockRadius = min(box.maxWidth, box.maxHeight) / 2;
          return ClockPiece(
            color: backgroundColor,
            isCircled: true,
            child: Stack(
              children: [
                for (int i = 0; i < 60; i++)
                  Positioned(
                    top: clockRadius,
                    left: clockRadius,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-2.0, i % 5 == 0 ? -8.0 : -4.0)
                        ..rotateZ(i / 60 * (2 * pi))
                        ..translate(0.0, clockRadius - 4.0),
                      child: ClockPiece(
                        width: 4,
                        height: i % 5 == 0 ? 16 : 8,
                        color: i % 5 == 0 ? specialSecondsColor : secondsColor,
                      ),
                    ),
                  ),
                for (int i = 0; i < 12; i++)
                  Positioned(
                    top: clockRadius,
                    left: clockRadius,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-15.0, -10.0)
                        ..rotateZ(i / 12 * (2 * pi) + pi)
                        ..translate(0.0, clockRadius - 30.0)
                        ..rotateZ((1 - i / 12) * (2 * pi) + pi),
                      child: SizedBox(
                        width: 30,
                        height: 20,
                        child: Text(
                          (i == 0 ? 60 : (i * 5) % 60)
                              .toString()
                              .padLeft(2, '0'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: clockRadius,
                  left: clockRadius,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return ClockHand(
                        height: clockRadius * 0.95,
                        color: secondsHandColor,
                        radius: 2.0,
                        width: 4.0,
                        angle: controller.millisecondsHandAngle,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: clockRadius * 1.3,
                  left: 0,
                  right: 0,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return ClockDigits(
                        elapsedTime: controller.elapsedTime,
                        color: textColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
