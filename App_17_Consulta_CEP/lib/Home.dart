import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = new TextEditingController();
  String info_endereco = '';

  _consultarCEP() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      info_endereco =
          'Rua: $logradouro \n Bairro: $bairro \n Cidade: $localidade \n Estado: $uf ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Consultar Código de Endereçamento Postal - CEP"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _corpo() {
    return Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Digitar o CEP:",
                labelStyle: TextStyle(color: Colors.black)),
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 30),
            controller: cepController,
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(height: 50, child: btnConsultar())),
          Text(info_endereco),
        ]));
  }

  btnConsultar() {
    return RaisedButton(
      onPressed: _consultarCEP,
      child: Text("Consultar CEP",
          style: TextStyle(color: Colors.white, fontSize: 15)),
      color: Colors.green,
    );
  }
}
