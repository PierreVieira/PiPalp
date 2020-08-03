class Dimensao{
  double largura;
  double altura;

  Dimensao({this.largura, this.altura});

  void aumentar(int dimensionUpgrade){
    this.altura *= (1 + (dimensionUpgrade / 10));
    this.largura *= (1 + (dimensionUpgrade / 10));
  }

  @override
  String toString() {
    return 'Dimensao{largura: $largura, altura: $altura}';
  }
}