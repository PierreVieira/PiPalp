class Dimensao{
  double largura, altura, _larguraOriginal, _alturaOriginal;
  Dimensao({this.largura, this.altura}){
    this._larguraOriginal = this.largura;
    this._alturaOriginal = this.altura;
  }

  void aumentar(){
    this.largura *= 1.08;
    this.altura *= 1.08;

    if(this.largura > 1.4*this._larguraOriginal) {
      this.largura = this._larguraOriginal;
    }

    if(this.altura > 1.4*this._alturaOriginal) {
      this.altura = this._alturaOriginal;
    }
  }

  @override
  String toString() {
    return 'Dimensao{largura: $largura, altura: $altura}';
  }
}