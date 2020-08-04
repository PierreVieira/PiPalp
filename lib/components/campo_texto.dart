import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controlador;

  const CampoTexto({this.controlador});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          hintText: 'Digite o palpite',
        ),
        keyboardType: TextInputType.number,
        maxLength: 3,
      ),
    );
  }
}
