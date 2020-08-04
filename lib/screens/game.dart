import 'package:flutter/material.dart';
import 'package:project/components/display.dart';
import 'package:project/components/envio_resposta.dart';
import 'package:project/models/dimensao.dart';

String _textoStatus = 'Acertou';
int _dimensionUpgrade = 1;
final String _titleAppBar = 'PiPalp';
final String _textoBotaoNovaPartida = 'Nova Partida';

class JogoAdivinha extends StatefulWidget {
  @override
  _JogoAdivinhaState createState() => _JogoAdivinhaState();
}

class _JogoAdivinhaState extends State<JogoAdivinha> {
  Dimensao _dimensao;

  @override
  Widget build(BuildContext context) {
    _dimensao = Dimensao(
      altura: 0.15 * MediaQuery.of(context).size.height,
      largura: 0.25 * MediaQuery.of(context).size.width,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.format_size,
              color: Colors.white,
            ),
            onPressed: () {
              _dimensionUpgrade += 1;
              if (_dimensionUpgrade == 6) {
                _dimensionUpgrade = 1;
              }
              setState(() {
                _textoStatus = _textoStatus == 'Acertou!' ? 'oi' : 'Acertou!';
                _dimensao.aumentar(_dimensionUpgrade);
                debugPrint('Print1: $_dimensao');
              });
            },
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 96.0, bottom: 16.0),
            child: Text(_textoStatus),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Display(
                numero: 5,
                dimensao: this._dimensao,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(_textoBotaoNovaPartida),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 208.0),
            child: EnvioRespostaField(),
          ),
        ],
      ),
    );
  }
}
