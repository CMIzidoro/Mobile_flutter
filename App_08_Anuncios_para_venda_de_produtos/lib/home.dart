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
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Colors.yellow,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto('Anúncios - Para ver mais, deliszar para esquerda!'),
            _carrossel(), //
          ],
        ),
      ),
    );
  }

  _carrossel() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      child: PageView(
        children: <Widget>[
          _foto('casa.jpg',
              'Venha morar em um das melhores regiões de São Paulo!'),
          _foto('flat.jpg',
              'Compre seu Flat, e ganhe seu quarto planejado, Somente este Mês!'),
          _foto('sitio.jpg',
              'Venha morar longe dos barulhos de São Paulo e vivendo com a natureza!'),
        ],
      ),
    );
  }

  _foto(String nomeFoto, String textoFoto) {
    return Container(
        child: Column(children: [
      Image.asset(
        "assets/image/$nomeFoto",
        height: 300,
        fit: BoxFit.cover,
      ),
      _textDescricao(textoFoto)
    ]));
  }

  _texto(String texto) {
    return Text(
      "$texto",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.yellow,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
          decorationColor: Colors.blueAccent,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _textDescricao(String texto) {
    return Text(
      "$texto",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
          decorationColor: Colors.blueAccent,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
