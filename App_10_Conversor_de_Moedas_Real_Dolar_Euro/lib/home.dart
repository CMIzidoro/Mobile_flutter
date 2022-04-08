import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController moneyController = TextEditingController();
  String dropdownValor01 = 'Real';
  String dropdownValor02 = 'Dolar';
  String InfoResultado = "";

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
      title: Text("Conversor de Moedas!"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _corpo() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _textoPrincipal('Digitar o valor a converter: '),
              _texto('Converter de: '),
              _dropdown01(),
              _texto('Converter para: '),
              _dropdown02(),
              _btnConverter(),
              _resultado(),
            ]));
  }

  _textoPrincipal(String texto) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "$texto",
          labelStyle: TextStyle(color: Colors.white, fontSize: 25.0)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 25),
      controller: moneyController,
    );
  }

  _texto(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 30),
    );
  }

  _resultado() {
    return Text(
      InfoResultado,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 30),
    );
  }

  _btnConverter() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 30,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text("Converter",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.purple,
        ),
      ),
    );
  }

  void _calcular() {
    setState(() {
      double dolarReal = 5.54;
      double realDolar = 0.18;
      double valor = double.parse(moneyController.text);
      if (dropdownValor01 == 'Real' && dropdownValor02 == 'Dolar') {
        double resultado01 = valor / dolarReal;
        String valorReal = resultado01.toStringAsFixed(2);
        InfoResultado = 'R\$$valor = U\$$valorReal';
      }
      if (dropdownValor01 == 'Dolar' && dropdownValor02 == 'Real') {
        double resultado01 = valor * dolarReal;
        String valorReal = resultado01.toStringAsFixed(2);
        InfoResultado = 'U\$$valor = R\$$valorReal';
      }
      if (dropdownValor01 == dropdownValor02) {
        InfoResultado = 'Você deve escolher uma moeda oposta!';
      }
    });
  }

  _dropdown01() {
    return DropdownButton<String>(
      value: dropdownValor01,
      items: <String>['Real', 'Dolar'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 20)),
        );
      }).toList(),
      onChanged: (String? valorSlecionado) {
        setState(() {
          dropdownValor01 = valorSlecionado!;
        });
      },
    );
  }

  _dropdown02() {
    return DropdownButton<String>(
      value: dropdownValor02,
      items: <String>['Real', 'Dolar'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 20)),
        );
      }).toList(),
      onChanged: (String? valorSlecionado) {
        setState(() {
          dropdownValor02 = valorSlecionado!;
        });
      },
    );
  }
}
