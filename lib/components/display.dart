/*
* A classe Display é a responsável por apresentar os números ao usuário de forma dinâmica.*/


import 'package:flutter/material.dart';
import 'package:project/models/dimensao.dart';

import 'tela_unica.dart';

class Display extends StatelessWidget {
  int numero;
  Dimensao dimensao;
  Color cor;

  Display({this.numero, this.dimensao, this.cor});

  @override
  Widget build(BuildContext context) {
    /*
    * A classe retorna 1, 2 ou 3 displays de 7 segmentos em linha dependendo do número passado como parâmetro*/
    this.numero = this.numero != null ? this.numero : 0;
    if(numero > 99){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TelaUnica(numero: int.parse(this.numero.toString()[0]), dimensao: dimensao, color: cor, umDiferente: false),
          TelaUnica(numero: int.parse(this.numero.toString()[1]), dimensao: dimensao, color: cor, umDiferente: false),
          TelaUnica(numero: int.parse(this.numero.toString()[2]), dimensao: dimensao, color: cor, umDiferente: true),
        ],
      );
    }
    else if (numero > 9){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TelaUnica(numero: int.parse(this.numero.toString()[0]), dimensao: dimensao, color: cor, umDiferente: false,),
          TelaUnica(numero: int.parse(this.numero.toString()[1]), dimensao: dimensao, color: cor, umDiferente: true),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TelaUnica(numero: this.numero, dimensao: dimensao, color: cor, umDiferente: false),
      ],
    );
  }
}
