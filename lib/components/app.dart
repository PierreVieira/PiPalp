import 'package:flutter/material.dart';
import 'package:project/screens/game.dart';

class PiPalp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.pink[500],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.pink[500],
              textTheme: ButtonTextTheme.primary)),
      home: JogoAdivinha(),
    );
  }
}
