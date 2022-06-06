import 'package:flutter/material.dart';
import 'package:app_conta_formulario/pages/Resultados.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  String dropdownSexoResposta = 'Não declarado';
  String dropdownEscolaridadeResposta = 'Nível';
  double respostaSlider = 0;
  bool respostaSwitch = false;
  String Resultado = "";

  @override
  Widget build(BuildContext dados) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.black,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Abertura de Conta"),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _nome(),
              _idade(),
              _texto('sexo:'),
              _dropdownSexo(),
              _texto('Escolaridade:'),
              _dropdownEscolaridade(),
              _texto('Cartão de Crédito: Limite desejado'),
              _slider(),
              _texto('Brasileiro?'),
              _switch(),
              _btnConfirmar(),
              _texto(Resultado),
            ]));
  }

  _nome() {
    return TextField(
      decoration: InputDecoration(
          labelText: "Nome:",
          labelStyle: TextStyle(color: Colors.white, fontSize: 25.0)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 25.0),
      controller: nomeController,
    );
  }

  _idade() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Idade:",
          labelStyle: TextStyle(color: Colors.white, fontSize: 25.0)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 25.0),
      controller: idadeController,
    );
  }

  _texto(String resposta) {
    return Text(
      resposta,
      style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _dropdownSexo() {
    return DropdownButton<String>(
      value: dropdownSexoResposta,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        backgroundColor: Colors.black,
      ),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownSexoResposta = newValue!;
        });
      },
      items: <String>['Masculino', 'Feminino', 'LGBTQI+', 'Não declarado']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      value: dropdownEscolaridadeResposta,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        backgroundColor: Colors.black,
      ),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownEscolaridadeResposta = newValue!;
        });
      },
      items: <String>[
        'Ensino Fundamental Incompleto',
        'Ensino Fundamental Completo',
        'Ensino Médio Incompleto',
        'Ensino Médio Completo',
        'Ensino Superior Incompleto',
        'Ensino Superior Completo',
        'Nível'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _slider() {
    return Slider(
      value: respostaSlider,
      min: 0,
      max: 2000,
      divisions: 50,
      label: respostaSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          respostaSlider = value;
        });
      },
    );
  }

  _switch() {
    return Switch(
      value: respostaSwitch,
      onChanged: (value) {
        setState(() {
          respostaSwitch = value;
        });
      },
    );
  }

  _btnConfirmar() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 35),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _confirmar,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
          color: Colors.red,
        ),
      ),
    );
  }

  _btn(BuildContext dados, Widget tela, String textoBotao) {
    return RaisedButton(
        color: Colors.green,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickTelaDados(dados, tela);
        });
  }

  _onClickTelaDados(BuildContext dados, Widget tela) {
    setState(() {
      Navigator.push(
        dados,
        MaterialPageRoute(builder: (BuildContext dados) {
          return tela;
        }),
      );
    });
  }

  _confirmar() {
    setState(() {
      String nome = nomeController.text.toString();
      double idade = double.parse(idadeController.text);
      String nacionalidade =
          respostaSwitch == true ? "Brasileiro" : "Estrangeiro";
      _onClickTelaDados(
          context,
          Resultados(
              nome: nome,
              idade: idade,
              sexo: dropdownSexoResposta,
              escolaridade: dropdownEscolaridadeResposta,
              limite: respostaSlider,
              nacionalidade: respostaSwitch.toString()));
    });
  }
}
