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
    this.numero = this.numero != null ? this.numero : 0;
    if(numero > 99){
      return Padding(
        padding: const EdgeInsets.only(left: 56.0),
        child: Row(
          children: <Widget>[
            TelaUnica(numero: int.parse(this.numero.toString()[0]), dimensao: dimensao, color: cor, umDiferente: false),
            TelaUnica(numero: int.parse(this.numero.toString()[1]), dimensao: dimensao, color: cor, umDiferente: false),
            TelaUnica(numero: int.parse(this.numero.toString()[2]), dimensao: dimensao, color: cor, umDiferente: true),
          ],
        ),
      );
    }
    else if (numero > 9){
      return Padding(
        padding: const EdgeInsets.only(left: 104.0),
        child: Row(
          children: <Widget>[
            TelaUnica(numero: int.parse(this.numero.toString()[0]), dimensao: dimensao, color: cor, umDiferente: false,),
            TelaUnica(numero: int.parse(this.numero.toString()[1]), dimensao: dimensao, color: cor, umDiferente: true),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 168.0),
      child: Row(
        children: <Widget>[
          TelaUnica(numero: this.numero, dimensao: dimensao, color: cor, umDiferente: false),
        ],
      ),
    );
  }
}
