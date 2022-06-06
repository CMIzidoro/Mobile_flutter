import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String info_endereco = '';
  String converterDe = '';
  String converterPara = '';
  int realParaDolar = 0;
  int realParaEuro = 0;
  int realParaBitcoin = 0;

  _Conversao(String de, String para) async {
    String urlDolar = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
    String urlBitcoin = 'https://economia.awesomeapi.com.br/json/all/BTC-BRL';
    String urleuro = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';

    http.Response response = await http.get(Uri.parse(urlDolar));
    Map<String, dynamic> retorno = json.decode(response.body);
    realParaDolar = retorno["ask"];

    http.Response response2 = await http.get(Uri.parse(urleuro));
    Map<String, dynamic> retorno2 = json.decode(response2.body);
    realParaEuro = retorno2["ask"];

    http.Response response3 = await http.get(Uri.parse(urlBitcoin));
    Map<String, dynamic> retorno3 = json.decode(response3.body);
    realParaBitcoin = retorno3["ask"];
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
      title: Text("Conversor de Moedas"),
    );
  }

  _corpo() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Digite o valor:",
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: cepController,
          ),
          _text('Converter de:'),
          _dropdownButton('de'),
          _text('Para:'),
          _dropdownButton('para'),
          // _getConversao(converterDe, converterPara),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Container(
              height: 50.0,
              child: RaisedButton(
                onPressed:
                    _text(_convertDolarEuroBitcoin(converterDe, converterPara)),
                child: Text("Obter endereço",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.blue,
              ),
            ),
          ),
          Text(info_endereco),
        ],
      ),
    );
  }

  _dropdownButton(String tipoConversao) {
    return DropdownButton<String>(
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          if (tipoConversao == 'de') {
            converterDe = newValue!;
          } else {
            converterPara = newValue!;
          }
        });
      },
      items: <String>['Real', 'Dolar', 'Bitcoin', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _text(String texto) {
    return Text(
      '$texto',
      style: TextStyle(fontSize: 30.0),
    );
  }

  _convertDolarEuroBitcoin(String de, String para) {
    if (de == 'Real' && para == 'Dolar') {
      return realParaDolar;
    } else if (de == 'Real' && para == 'Euro') {
      return realParaEuro;
    } else if (de == 'Real' && para == 'Bitcoin') {
      return realParaBitcoin;
    } else if (de == 'Dolar' && para == 'Real') {
      return realParaDolar / realParaDolar;
    } else if (de == 'Dolar' && para == 'Euro') {
      return realParaDolar / realParaEuro;
    } else if (de == 'Dolar' && para == 'Bitcoin') {
      return realParaDolar / realParaBitcoin;
    } else if (de == 'Euro' && para == 'Real') {
      return realParaEuro / realParaDolar;
    } else if (de == 'Euro' && para == 'Dolar') {
      return realParaEuro / realParaDolar;
    } else if (de == 'Euro' && para == 'Bitcoin') {
      return realParaEuro / realParaBitcoin;
    } else if (de == 'Bitcoin' && para == 'Real') {
      return realParaBitcoin / realParaDolar;
    } else if (de == 'Bitcoin' && para == 'Dolar') {
      return realParaBitcoin / realParaDolar;
    } else if (de == 'Bitcoin' && para == 'Euro') {
      return realParaBitcoin / realParaEuro;
    }
  }
}
