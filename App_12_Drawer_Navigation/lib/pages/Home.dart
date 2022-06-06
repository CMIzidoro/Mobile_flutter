import 'package:flutter/material.dart';
import 'package:app_drawer_navigation/pages/Pessoal.dart';
import 'package:app_drawer_navigation/pages/Formacao.dart';
import 'package:app_drawer_navigation/pages/Experiencia.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final telas = [
    Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Sobre Lucas Pereira!'),
      ],
    )),
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.black,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Cassio Martinez'),
              accountEmail: Text('cassiomartinez2@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('asstes/images/foto.jpg'),
              ),
            ),
            ListTile(
              title: Text('Peassoal'),
              subtitle: Text('Meu Perfil'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              title: Text('Formação'),
              subtitle: Text('Formação Acadêmica'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              title: Text('Experiência'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text('Curriculum!'),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }
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
