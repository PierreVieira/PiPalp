import 'package:flutter/material.dart';

import 'number_editor.dart';

class EnvioRespostaField extends StatelessWidget {
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
              child: NumberEditor(),
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