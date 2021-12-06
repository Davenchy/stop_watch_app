import 'package:flutter/material.dart';

class ClockPiece extends StatelessWidget {
  const ClockPiece({
    Key? key,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.isCircled = false,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? radius;
  final bool isCircled;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCircled ? radius : width,
      height: isCircled ? radius : height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: !isCircled && radius != null
            ? BorderRadius.circular(radius!)
            : null,
        shape: isCircled ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
