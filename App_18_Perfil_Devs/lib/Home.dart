import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gitController = TextEditingController();
  String infoGit = '';
  String fotoGit = '';

  _consultarGit() async {
    String url = 'https://api.github.com/users/${gitController.text}';

    print(url);
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    if (retorno['id'] == null) {
      infoGit = 'Usuário não localizado';
      fotoGit = '';
    } else {
      fotoGit = retorno['avatar_url'];
      String id = retorno['id'].toString();
      String nome = retorno['name'];
      String repositorios = retorno['public_repos'].toString();
      String criadoEm = retorno['created_at'].toString();
      String seguidores = retorno['followers'].toString();
      String seguindo = retorno['following'].toString();
      infoGit =
          '\n ID: $id \n Nome: $nome \n Repositórios: $repositorios \n Criado em: $criadoEm \n Seguidores: $seguidores \n Seguindo: $seguindo';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
      backgroundColor: Colors.black,
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Perfil dos Devs"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _corpo() {
    return Container(
        padding: EdgeInsets.all(50),
        child: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite o Login:",
              labelStyle: TextStyle(color: Colors.white),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
            controller: gitController,
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Container(height: 40, child: _btn())),
          Image.network('$fotoGit' == '' ? 'assets/images/github.jpg' : fotoGit,
              height: 100, width: 100),
          Text(infoGit, style: TextStyle(color: Colors.white, fontSize: 25)),
        ]));
  }

  _btn() {
    return RaisedButton(
      onPressed: _consultarGit,
      child: Text("Ver Perfil",
          style: TextStyle(color: Colors.purple, fontSize: 20)),
    );
  }
}
