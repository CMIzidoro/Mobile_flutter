import 'package:flutter/material.dart';
import 'package:app_bottom_navigation/pages/Pessoal.dart';
import 'package:app_bottom_navigation/pages/Formacao.dart';
import 'package:app_bottom_navigation/pages/Experiencia.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final telas = [
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.orange,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Pessoal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in),
              label: 'Formação',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'Experiêcnia',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
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
