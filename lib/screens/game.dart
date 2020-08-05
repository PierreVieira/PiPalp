/*
* Talvez esse seja o arquivo mais confuso de todos. Ele basicamente é o cérebro
* da aplicação, é onde temos as referências globais e os principais métodos.
* Infelizmente a medida que a implementação foi crescendo foi ficando cada vez mais difícil dividir o código
* e me parece que o setState não funcionava da forma esperada quando eu tentava dividir muito, pesquisei
* soluções alternativas e vi algo chamado BLoC, mas devido a falta de tempo não poderei implementar por completo.
*
* A solução encontrada para a paleta de cores foi utilizar um list view horizontal em que cada componente
* pode ser clicável, a solução auxiliar para isso foi utilizar o InkWell do Material*/



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/components/campo_texto.dart';
import 'package:project/components/display.dart';
import 'package:project/models/dimensao.dart';

String _textoStatus = '';
int _numero = 0;
double _ratingSlider = 0;
double _opacidadeSlider = 0;
double _opacidadeBotaoNovaPartida = 0;
double _opacidadePaletaDeCores = 0;
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

BaseOptions options = BaseOptions(
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
      _opacidadePaletaDeCores = 0;
      _opacidadeSlider = 0;
      _dimensao = Dimensao(
        altura: 0.15 * MediaQuery.of(context).size.height,
        largura: 0.25 * MediaQuery.of(context).size.width,
      );
    }
    return Material(
      child: InkWell(
        onTap: (){
          setState(() {
            _opacidadePaletaDeCores = 0;
            _opacidadeSlider = 0;
          });
        },
        child: Scaffold(
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
                    _opacidadePaletaDeCores = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _opacidadePaletaDeCores = _opacidadePaletaDeCores == 1 ? 0 : 1;
                    _opacidadeSlider = 0;
                  });
                },
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              Opacity(
                opacity: _opacidadePaletaDeCores,
                child: Container(
                  height: _dimensao.altura / 4,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.pink[500];
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.pink[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.blue[500];
                          });
                        }: null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.blue[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.yellow[500];
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.yellow[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.orange[500];
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.orange[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.green[500];
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.green[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.purple[500];
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.purple[500],
                        ),
                      ),
                      InkWell(
                        onTap: _opacidadePaletaDeCores != 0 ? () {
                          setState(() {
                            displayColor = Colors.black;
                          });
                        } : null,
                        child: Container(
                          width: _dimensao.largura,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: _opacidadeSlider,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Material(
                    child: Container(
                      height: 40,
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
                                _opacidadeSlider = 0;
                                _opacidadePaletaDeCores = 0;
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
                                      _opacidadeSlider = 0;
                                      _opacidadePaletaDeCores = 0;
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
        ),
      ),
    );
  }

  void getNumber() async {
    /*
    * O método getNumber é chamado para fazer uma nova requisição na API,
    * esse método é chamado na constrção da tela e toda vez que o botão "Nova Partida"
    * é clicado*/
    try {
        Response response = await _dio.get(_request);
        _respostaNumerica = response.data["value"];
        debugPrint('Nova resposta gerada: $_respostaNumerica');
    } catch (DioError) {
      _numero = 502;
      _textoStatus = 'Erro';
      setState(() {
        _opacidadeBotaoNovaPartida = 1;
        _novaPartida = true;
      });
    }
  }
}
