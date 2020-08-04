import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/components/campo_texto.dart';
import 'package:project/components/display.dart';
import 'package:project/models/dimensao.dart';

String _textoStatus = '';
int _numero = 0;
double _ratingSlider = 1.0;
double _opacidadeSlider = 0;
double _opacidadeBotaoNovaPartida = 0;
int _respostaNumerica;
bool _novaPartida = false;
bool _enviarHabilitado = true;
bool start = true;
Dimensao _dimensao;
Color displayColor;
final String _titleAppBar = 'PiPalp';
final String _textoBotaoNovaPartida = 'Nova Partida';
final String _request =
    'https://us-central1-ss-devops.cloudfunctions.net/rand?min=1&max=300';
final TextEditingController controlador = TextEditingController();

BaseOptions options = new BaseOptions(
  baseUrl: "https://us-central1-ss-devops.cloudfunctions.net",
  connectTimeout: 5000,
);

Dio _dio = Dio(options);

class JogoAdivinha extends StatefulWidget {
  @override
  _JogoAdivinhaState createState() => _JogoAdivinhaState();
}

class _JogoAdivinhaState extends State<JogoAdivinha> {
  @override
  Widget build(BuildContext context) {
    _novaPartida = _textoStatus == 'Acertou!' || _textoStatus == 'Erro';
    _enviarHabilitado = !_novaPartida;
    if (start) {
      getNumber();
      start = false;
      _dimensao = Dimensao(
        altura: 0.15 * MediaQuery.of(context).size.height,
        largura: 0.25 * MediaQuery.of(context).size.width,
      );
    }
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
              setState(() {
                _opacidadeSlider = _opacidadeSlider == 1 ? 0 : 1;
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
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: _opacidadeSlider,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.pink[100],
                child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Slider(
                    value: _ratingSlider,
                    activeColor: Colors.pink[700],
                    onChanged: _opacidadeSlider == 0
                        ? null
                        : (double newValue) {
                            setState(() {
                              _ratingSlider = newValue;
                              _dimensao.aumentar(_ratingSlider / 2);
                              debugPrint('$newValue');
                            });
                          },
                    divisions: 5,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(_textoStatus),
              Container(
                color: Colors.white,
                child: Display(
                  numero: _numero,
                  dimensao: _dimensao,
                  cor: displayColor,
                ),
              ),
              Opacity(
                opacity: _opacidadeBotaoNovaPartida,
                child: RaisedButton(
                  child: Text(_textoBotaoNovaPartida),
                  onPressed: _novaPartida
                      ? () {
                          setState(() {
                            _textoStatus = '';
                            getNumber();
                            _numero = 0;
                          });
                        }
                      : null,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CampoTexto(
                        controlador: controlador,
                      ),
                      RaisedButton(
                        onPressed: _enviarHabilitado
                            ? () {
                                setState(() {
                                  _numero = int.tryParse(controlador.text);
                                  _textoStatus = _respostaNumerica > _numero
                                      ? 'É maior'
                                      : _respostaNumerica < _numero
                                          ? 'É menor'
                                          : 'Acertou!';
                                  debugPrint(
                                      'Resposta = $_respostaNumerica\nPalpite = $_numero');
                                  _opacidadeBotaoNovaPartida =
                                      (_textoStatus == 'Acertou!' ||
                                              _textoStatus == 'Erro')
                                          ? 1.0
                                          : 0.0;
                                });
                              }
                            : null,
                        child: Text('Enviar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getNumber() async {
    try {
      Response response = await _dio.get(_request);
      _respostaNumerica = response.data["value"];
      debugPrint('Nova resposta gerada: $_respostaNumerica');
    } catch (DioError) {
      _numero = 502;
      _textoStatus = 'Erro';
    }
  }
}
