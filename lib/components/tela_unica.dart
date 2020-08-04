import 'package:flutter/material.dart';
import 'package:project/models/dimensao.dart';
import 'package:project/models/led.dart';

import '../models/desenhista_display.dart';

class TelaUnica extends StatelessWidget {
  int numero;
  Dimensao dimensao;
  Color color;
  bool umDiferente;
  TelaUnica({this.numero, this.dimensao, this.color, this.umDiferente});

  @override
  Widget build(BuildContext context) {
//    debugPrint('Print2: $dimensao');
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        width: dimensao.largura*0.8,
        height: dimensao.altura*1.3,
//        width: 0.15 * MediaQuery.of(context).size.height,
//        height: 0.25 * MediaQuery.of(context).size.width,
        color: Colors.white,
        child: CustomPaint(
          painter: DesenhistaDisplay(leds: escolherLeds(), cor: color),
        ),
      ),
    );
  }

  List<Led> escolherLeds() {
    switch (numero) {
      case 0:
        return makeLed0();
      case 1:
        return makeLed1();
      case 2:
        return makeLed2();
      case 3:
        return makeLed3();
      case 4:
        return makeLed4();
      case 5:
        return makeLed5();
      case 6:
        return makeLed6();
      case 7:
        return makeLed7();
      case 8:
        return makeLed8();
      case 9:
        return makeLed9();
    }
  }

  List<Led> makeLed0() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: true, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: false, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed1() {
    List<Led> leds = List();
    if(this.umDiferente){
      leds.add(LedA(aceso: false, dimensao: dimensao));
      leds.add(LedB(aceso: false, dimensao: dimensao));
      leds.add(LedC(aceso: false, dimensao: dimensao));
      leds.add(LedD(aceso: false, dimensao: dimensao));
      leds.add(LedE(aceso: true, dimensao: dimensao));
      leds.add(LedF(aceso: true, dimensao: dimensao));
      leds.add(LedG(aceso: false, dimensao: dimensao));
    }else{
      leds.add(LedA(aceso: false, dimensao: dimensao));
      leds.add(LedB(aceso: true, dimensao: dimensao));
      leds.add(LedC(aceso: true, dimensao: dimensao));
      leds.add(LedD(aceso: false, dimensao: dimensao));
      leds.add(LedE(aceso: false, dimensao: dimensao));
      leds.add(LedF(aceso: false, dimensao: dimensao));
      leds.add(LedG(aceso: false, dimensao: dimensao));
    }
    return leds;
  }

  List<Led> makeLed2() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: false, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: true, dimensao: dimensao));
    leds.add(LedF(aceso: false, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed3() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: false, dimensao: dimensao));
    leds.add(LedF(aceso: false, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed4() {
    List<Led> leds = List();
    leds.add(LedA(aceso: false, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: false, dimensao: dimensao));
    leds.add(LedE(aceso: false, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed5() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: false, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: false, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed6() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: false, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: true, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed7() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: false, dimensao: dimensao));
    leds.add(LedE(aceso: false, dimensao: dimensao));
    leds.add(LedF(aceso: false, dimensao: dimensao));
    leds.add(LedG(aceso: false, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed8() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: true, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }

  List<Led> makeLed9() {
    List<Led> leds = List();
    leds.add(LedA(aceso: true, dimensao: dimensao));
    leds.add(LedB(aceso: true, dimensao: dimensao));
    leds.add(LedC(aceso: true, dimensao: dimensao));
    leds.add(LedD(aceso: true, dimensao: dimensao));
    leds.add(LedE(aceso: false, dimensao: dimensao));
    leds.add(LedF(aceso: true, dimensao: dimensao));
    leds.add(LedG(aceso: true, dimensao: dimensao));
    return leds;
  }
}
