import 'package:flutter/material.dart';

class Pessoal extends StatelessWidget {
  const Pessoal({Key? key}) : super(key: key);

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
        _texto('Informações Pessoais: \n'),
        _texto('Nome: Cassio Martinez'),
        _texto('Telefone: (13) 996091880'),
        _texto('Sou estudante de Análise e Desenvolvimento de Sistemas')
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
