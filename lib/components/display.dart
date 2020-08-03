import 'package:flutter/material.dart';
import 'package:project/models/componente_display.dart';
import 'package:project/models/led_display.dart';

class Display extends StatelessWidget {
  final int _numero;

  Display(this._numero);

  @override
  Widget build(BuildContext context) {
    if(_numero > 99){
      return Row(
        children: <Widget>[
          ComponenteDisplay(),
          ComponenteDisplay(),
          ComponenteDisplay(),
        ],
      );
    }
    else if (_numero > 9){
      return Row(
        children: <Widget>[
          ComponenteDisplay(),
          ComponenteDisplay(),
        ],
      );
    }
    return Row(
      children: <Widget>[
        ComponenteDisplay(),
      ],
    );
  }
}
