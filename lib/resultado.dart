import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _resetQuestions;

  Resultado(this.pontuacao, this._resetQuestions);

  String get resultPhrase {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        )),
        OutlinedButton(
          onPressed: _resetQuestions,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.cyanAccent,
            side: BorderSide(width: 1.0, color: Colors.blue),
          ),
          child: Text('Reiniciar questionário?'),
        )
      ],
    );
  }
}
