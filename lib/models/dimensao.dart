class Dimensao{
  double largura, altura, _larguraOriginal, _alturaOriginal;
  Dimensao({this.largura, this.altura}){
    this._larguraOriginal = this.largura;
    this._alturaOriginal = this.altura;
  }

  void aumentar(aumento){
    this.largura = (1 + aumento) * this._larguraOriginal;
    this.altura = (1 + aumento) * this._alturaOriginal;
  }

  @override
  String toString() {
    return 'Dimensao{largura: $largura, altura: $altura}';
  }
}