import 'package:flutter/material.dart';

class Filmes extends StatelessWidget {
  final String valueNome, valueDescricao;

  const Filmes({required this.valueNome, required this.valueDescricao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text('Sinopse - $valueNome'),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _corpo() {
    return Container(
      child: Center(child: Text('$valueDescricao')),
    );
  }
}
