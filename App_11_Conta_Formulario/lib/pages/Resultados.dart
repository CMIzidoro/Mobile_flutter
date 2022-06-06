import 'package:flutter/material.dart';

class Resultados extends StatelessWidget {
  String nome;
  double idade;
  String sexo;
  String escolaridade;
  double limite;
  String nacionalidade;

  Resultados(
      {required this.nome,
      required this.idade,
      required this.sexo,
      required this.escolaridade,
      required this.limite,
      required this.nacionalidade});

  @override
  Widget build(BuildContext dados) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Informados:'),
      ),
      body: _corpo(dados),
      backgroundColor: Colors.black,
    );
  }

  _corpo(BuildContext dados) {
    return Center(
        child: Column(children: <Widget>[
      _texto('Nome: $nome'),
      _texto('Idade: $idade'),
      _texto('Sexo: $sexo'),
      _texto('Escolaridade: $escolaridade'),
      _texto('Limite Desejado: $limite'),
      _texto('Nacionalidade: $nacionalidade'),
      RaisedButton(
        child: Text('Voltar'),
        onPressed: () => _onClickVoltar(dados),
      )
    ]));
  }

  _texto(String resposta) {
    return Text(
      resposta,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _onClickVoltar(BuildContext dados) {
    Navigator.pop(dados);
  }
}
