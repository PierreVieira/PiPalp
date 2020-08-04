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
      paint.color = led.aceso ? Colors.pink[500] : Colors.grey[100];
      startingPoint = Offset(led.coordenadaOrigem.x, led.coordenadaOrigem.y);
      endingPoint = led.horizontal
          ? Offset(led.coordenadaOrigem.x + led.tamanho, led.coordenadaOrigem.y)
          : Offset(
              led.coordenadaOrigem.x, led.coordenadaOrigem.y + led.tamanho);
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
