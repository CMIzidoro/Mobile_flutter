import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_filmes/filmes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> filmes = List.empty();
  _recuperarFilme() async {
    String url = 'https://sujeitoprogramador.com/r-api/?api=filmes';

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = json.decode(response.body);

    print(retorno[2]);
    Map<String, dynamic> teste = retorno[3];

    setState(() {
      filmes = retorno;
      print(filmes.length);
    });
  }

  @override
  void initState() {
    _recuperarFilme();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App de Filmes"),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo() {
    return Center(
      child: ListView(
        children: [
          _filme(0),
          _filme(1),
          _filme(2),
          _filme(3),
        ],
      ),
    );
  }

  _filme(x) {
    return Column(
      children: [
        Row(children: [
          Text('${filmes[x]['nome']}'),
          VerticalDivider(color: Colors.white, width: 180),
          _btn(context, x),
        ]),
        Image.network('${filmes[x]['foto']}'),
      ],
    );
  }

  _lerSobre(BuildContext context, x) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Filmes(
            valueNome: '${filmes[x]['nome']}',
            valueDescricao: '${filmes[x]['Sinopse']}');
      }),
    );
  }

  _btn(BuildContext context, x) {
    return RaisedButton(
      onPressed: () {
        _lerSobre(context, x);
      },
      child: Text(
        'Ler Sobre',
        style: TextStyle(color: Colors.red),
      ),
      color: Colors.white,
    );
  }
}
