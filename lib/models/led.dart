import 'package:project/models/coordenada.dart';

class Led{
  bool aceso, horizontal;
  Coordenada coordenadaOrigem;
  int tamanho;
  Led({this.aceso}){
    this.aceso = this.aceso != null ? this.aceso : true;
  }
}

class LedA extends Led{
  LedA({bool aceso}) : super (aceso: aceso){
    this.tamanho = 25;
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0, 0);
  }
}