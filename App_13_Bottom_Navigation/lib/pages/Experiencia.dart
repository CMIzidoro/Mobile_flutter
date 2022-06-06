import 'package:flutter/material.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _corpo(context),
      backgroundColor: Colors.black,
    );
  }

  _corpo(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Minhas Experiência: \n'),
        _texto('amor saude'),
        _texto('estagiario\n'),
        _texto('sensedia'),
        _texto('estagiario\n'),
      ],
    ));
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
