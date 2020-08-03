import 'package:flutter/material.dart';
import 'package:project/models/led.dart';

class DesenhistaDisplay extends CustomPainter {
  List<Led> leds;

  DesenhistaDisplay({this.leds});

  @override
  void paint(Canvas canvas, Size size) {
    Offset startingPoint, endingPoint;
    var paint = Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    for (Led led in leds) {
      paint.color = led.aceso ? Colors.pink[500] : Colors.white54;
      startingPoint = Offset(led.coordenadaOrigem.x, led.coordenadaOrigem.y);
      endingPoint = Offset(led.coordenadaOrigem.x + 25, led.coordenadaOrigem.y);
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
