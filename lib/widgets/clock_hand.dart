import 'dart:math';

import 'package:flutter/material.dart';

import 'clock_piece.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    Key? key,
    required this.height,
    required this.width,
    required this.angle,
    this.radius = 0.0,
    this.color,
  }) : super(key: key);

  final double height;
  final double width;
  final double angle;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-width / 2)
        ..rotateZ(pi + angle),
      child: ClockPiece(
        color: color,
        width: width,
        height: height,
        radius: radius,
      ),
    );
  }
}
