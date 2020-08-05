/*
* Essa classe é a que define o aplicativo, aqui são feitas as principais configurações
* de cores do app.*/


import 'package:flutter/material.dart';
import 'package:project/screens/game.dart';

class PiPalp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink[500],
          backgroundColor: Colors.white,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.pink[500],
              textTheme: ButtonTextTheme.primary)),
      home: JogoAdivinha(),
    );
  }
}
