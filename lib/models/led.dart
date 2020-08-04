import 'package:project/models/coordenada.dart';
import 'package:project/models/dimensao.dart';

class Led {
  bool aceso, horizontal;
  Coordenada coordenadaOrigem;
  Dimensao dimensao;
  int tamanho;

  Led({this.aceso, this.dimensao}) {
    this.aceso = this.aceso != null ? this.aceso : true;
    this.tamanho = 25;
  }
}

class LedA extends Led {
  LedA({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.3*dimensao.largura, 0.05*dimensao.altura);
  }
}

class LedB extends Led {
  LedB({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.3*dimensao.largura + 1.5*this.tamanho, 0.1*dimensao.altura);
  }
}

class LedC extends Led {
  LedC({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.3*dimensao.largura + 1.5*this.tamanho, 2.3*this.tamanho);
  }
}

class LedD extends Led {
  LedD({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.3*dimensao.largura, 0.9*dimensao.altura);
  }
}

class LedE extends Led {
  LedE({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.18*dimensao.largura, 2.3*this.tamanho);
  }
}

class LedF extends Led {
  LedF({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.18*dimensao.largura, 0.1*dimensao.altura);
  }
}

class LedG extends Led {
  LedG({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.3*dimensao.largura, 0.45*dimensao.altura);
  }
}