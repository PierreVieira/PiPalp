/*
* A classe Dimensão é essencial para nosso desenho ter proporção de acordo com
* o tamanho da tela do usuário. Ela é usada de base para o desenho de cada LED.
* */

class Dimensao{
  double largura, altura, _larguraOriginal, _alturaOriginal;
  Dimensao({this.largura, this.altura}){
    this._larguraOriginal = this.largura;
    this._alturaOriginal = this.altura;
  }

  void aumentar(aumento){
    /*
    * O método aumentar é chamado quando o usuário utiliza o slider do texto
    * O parâmetro aumento é a porcentagem que deve ser aumentada do tamanho original do LED*/
    this.largura = (1 + aumento) * this._larguraOriginal;
    this.altura = (1 + aumento) * this._alturaOriginal;
  }

  @override
  String toString() {
    return 'Dimensao{largura: $largura, altura: $altura}';
  }
}