import 'package:project/models/coordenada.dart';
import 'package:project/models/dimensao.dart';

class Led {
  bool aceso, horizontal;
  Coordenada coordenadaOrigem;
  Dimensao dimensao;
  double tamanho;

  Led({this.aceso, this.dimensao}) {
    this.aceso = this.aceso != null ? this.aceso : true;
    this.tamanho = 0.35*dimensao.altura;
  }
}

class LedA extends Led {
  LedA({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.75*0.33*dimensao.largura, 0.18*dimensao.altura);
  }
}

class LedB extends Led {
  LedB({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.75*0.3*dimensao.largura + 1.4*this.tamanho, 0.24*dimensao.altura);
  }
}

class LedC extends Led {
  LedC({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.75*0.3*dimensao.largura + 1.4*this.tamanho, 2.1*this.tamanho);
  }
}

class LedD extends Led {
  LedD({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.75*0.33*dimensao.largura, 1.15*dimensao.altura);
  }
}

class LedE extends Led {
  LedE({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.75*0.18*dimensao.largura, 2.1*this.tamanho);
  }
}

class LedF extends Led {
  LedF({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = false;
    this.coordenadaOrigem = Coordenada(0.75*0.18*dimensao.largura, 0.24*dimensao.altura);
  }
}

class LedG extends Led {
  LedG({bool aceso, Dimensao dimensao})
      : super(aceso: aceso, dimensao: dimensao) {
    this.horizontal = true;
    this.coordenadaOrigem = Coordenada(0.75*0.33*dimensao.largura, 0.66*dimensao.altura);
  }
}