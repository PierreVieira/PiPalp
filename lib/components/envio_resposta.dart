import 'package:flutter/material.dart';

class EnvioRespostaField extends StatelessWidget {
  final TextEditingController controlador;

  const EnvioRespostaField({this.controlador});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: controlador,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: 'Digite o palpite',
                ),
                keyboardType: TextInputType.number,
                maxLength: 3,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
