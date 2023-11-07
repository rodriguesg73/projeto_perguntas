// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoFinal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 2},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 9},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'Leo', 'pontuacao': 5},
        {'texto': 'Pedro', 'pontuacao': 6},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (hasQuestion) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoFinal += pontuacao;
      });
    }
  }

  void _resetQuestions() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoFinal = 0;
    });
  }

  bool get hasQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.indigo.shade600,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey.shade600,
        body: hasQuestion
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoFinal, _resetQuestions),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
