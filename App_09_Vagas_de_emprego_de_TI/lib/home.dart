import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.black,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas de Empregos em Tecnologia!"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _carrossel(),
          ],
        ),
      ),
    );
  }

  _carrossel() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 400,
      child: ListView(
        children: <Widget>[
          _foto('orange.jpg'),
          _vaga('Cientista de Dados'),
          _salario('15.000,00'),
          _funcao(
              'Vaga para cientista de Dados com experiencia em mineração de dados.'),
          _foto('ibm.jpg'),
          _vaga('Analistas de dados Senior'),
          _salario('8.900,00'),
          _funcao(
              'Vaga para Analista de Dados Senior, com experiencia em Banco de Dados Relacional.'),
          _foto('microsoft.jpg'),
          _vaga('Gerente de Projeto'),
          _salario('19.800,00'),
          _funcao(
              'Vaga para Gerente de Projeto, com experiencia e conhecimentos em metodologia Agíl. '),
        ],
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 250,
      fit: BoxFit.cover,
    );
  }

  _vaga(String texto) {
    return Text(
      '$texto',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _salario(String salario) {
    return Text('Salário:R\$$salario',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ));
  }

  _funcao(String funcao) {
    return Text("$funcao",
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white, fontSize: 25));
  }
}
