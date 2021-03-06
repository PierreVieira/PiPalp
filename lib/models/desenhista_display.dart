/*
* Essa é a classe que de fato desenha o LED na tela, para isso utilizei herança
* da classe CustomPainter para fazer o desenho dos LEDS
* */

import 'package:flutter/material.dart';
import 'package:project/models/led.dart';

class DesenhistaDisplay extends CustomPainter {
  /*
  * Essa classe recebe uma lista de LEDs a serem desenhados. Ela desenha um componente do display,
  * como por exemplo se o número 253 tiver que ser desenhado, ela será instanciada 3 vezes,
  * uma para cada algarismo do número 253.
  * */
  List<Led> leds;
  Color cor;
  DesenhistaDisplay({this.leds, this.cor});

  @override
  void paint(Canvas canvas, Size size) {
    Offset startingPoint, endingPoint;
    var paint = Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    for (Led led in leds) {
      paint.color = led.aceso ? (cor == null ? Colors.pink[500] : cor) : Colors.grey[100];
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
