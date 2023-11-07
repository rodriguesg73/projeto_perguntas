// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto, this.onSelection);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSelection,
          child: Text(texto),
          style: ElevatedButton.styleFrom(
              primary: Colors.indigo.shade800, onSurface: Colors.white),
        ));
  }
}
