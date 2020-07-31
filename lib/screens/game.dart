import 'package:flutter/material.dart';
import 'package:project/components/display.dart';

const String _titleAppBar = 'Qual é o número?';
String _textoStatus = 'Acertou';

class JogoAdivinha extends StatefulWidget {
  @override
  _JogoAdivinhaState createState() => _JogoAdivinhaState();
}

class _JogoAdivinhaState extends State<JogoAdivinha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.format_size,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(88.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(_textoStatus),
            ),
            Display()
          ],
        ),
      )
    );
  }
}
