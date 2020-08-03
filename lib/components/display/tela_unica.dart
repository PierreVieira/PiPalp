import 'package:flutter/material.dart';
import 'package:project/models/dimensao.dart';
import 'package:project/models/led.dart';

import '../../models/desenhista_display.dart';

class TelaUnica extends StatelessWidget {
  int numero;
  Dimensao dimensao;

  TelaUnica({this.numero, this.dimensao});

  @override
  Widget build(BuildContext context) {
//    debugPrint('Print2: $dimensao');
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        width: dimensao.largura,
        height: dimensao.altura,
//        width: 0.15 * MediaQuery.of(context).size.height,
//        height: 0.25 * MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: CustomPaint(
          painter: DesenhistaDisplay(leds: escolherLeds()),
        ),
      ),
    );
  }

  List<Led> escolherLeds() {
    return makeLed0();
  }

  List<Led> makeLed0() {
    List<Led> leds = List();
    leds.add(LedA(
      aceso: true,
    ));
    return leds;
  }
}
