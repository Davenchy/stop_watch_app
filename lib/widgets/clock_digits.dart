import 'package:flutter/material.dart';

class ClockDigits extends StatelessWidget {
  const ClockDigits({
    Key? key,
    required this.elapsedTime,
    this.color = Colors.white,
  }) : super(key: key);

  final Duration elapsedTime;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final String seconds =
        elapsedTime.inSeconds.remainder(60).toString().padLeft(2, '0');

    final String minutes =
        elapsedTime.inMinutes.remainder(60).toString().padLeft(2, '0');

    final String hours = elapsedTime.inHours.toString().padLeft(2, '0');

    return Text(
      '$hours:$minutes:$seconds',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
