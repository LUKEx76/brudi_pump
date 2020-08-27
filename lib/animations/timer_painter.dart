import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color foregroundColor;
  final double width;
  final double height;

  TimerPainter(
      {this.animation,
      this.backgroundColor,
      this.foregroundColor,
      this.width,
      this.height})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    paint.color = foregroundColor;
    double progress = animation.value * height;

    canvas.drawRRect(
        RRect.fromLTRBR(0, progress, width, height, Radius.circular(8)), paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        foregroundColor != old.foregroundColor ||
        backgroundColor != old.backgroundColor;
  }
}
