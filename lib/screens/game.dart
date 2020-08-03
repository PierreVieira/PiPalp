import 'package:flutter/material.dart';
import 'file:///C:/Users/pierr/IdeaProjects/Pi_Palp/lib/components/display/display.dart';
import 'package:project/components/envio_resposta/envio_resposta.dart';
import 'package:project/models/dimensao.dart';

final String _textoStatus = 'Acertou!';
final String _titleAppBar = 'PiPalp';
final String _textoBotaoNovaPartida = 'Nova Partida';

class JogoAdivinha extends StatelessWidget {
  Dimensao _dimensao;

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 64.0, bottom: 8.0),
            child: Text(_textoStatus),
          ),
          Container(
            color: Colors.white,
            child: Display(
              dimensao: this._dimensao,
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(_textoBotaoNovaPartida),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: EnvioRespostaField(),
          ),
        ],
      ),
    );
  }
}
