import 'package:flutter/material.dart';

class NumberEditor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final double espacamento;
  final double tamanhoFonte;
  final int maxLength;

  NumberEditor(
      {this.controlador,
      this.rotulo,
      this.dica,
      this.icone,
      this.espacamento,
      this.tamanhoFonte,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        icon: icone != null ? Icon(icone) : null,
        hintText: 'Digite o palpite',
      ),
      keyboardType: TextInputType.number,
      maxLength: 3,
    );
  }
}
