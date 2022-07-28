import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?',
        'resposta': [
            {'texto': 'Preto', 'pontuacao': 10},
            {'texto': 'Rosa', 'pontuacao': 5},
            {'texto': 'Azul', 'pontuacao': 3},
            {'texto': 'Roxo', 'pontuacao': 1},
          ],
      }, 
      {
        'texto': 'Quais é o seu animal favorito?',
        'resposta': [
          {'texto': 'Leão', 'pontuacao': 10},
          {'texto': 'Girafa', 'pontuacao': 5},
          {'texto': 'Cachorro', 'pontuacao': 3},
          {'texto': 'Gato', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual seu instrutor Favorito',
        'resposta': [
            {'texto': 'Maria', 'pontuacao': 10},
            {'texto': 'João', 'pontuacao': 5},
            {'texto': 'Leo', 'pontuacao': 3},
            {'texto': 'Pedro', 'pontuacao': 1},
          ],
      } 
    ];


  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas, 
        perguntaSelecionada: _perguntaSelecionada, 
        quandoResponder: _responder,
        ) : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}