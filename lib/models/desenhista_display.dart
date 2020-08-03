import 'package:flutter/material.dart';

class DesenhistaDisplay extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.square;

    Offset startingPoint = Offset(0, 0);
    Offset endingPoint = Offset(25, 0);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}