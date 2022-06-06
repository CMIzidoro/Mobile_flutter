import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String area = "";

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController();
  String dropdownarea = 'Qual sua Área?';
  String Resultado = "";
  File file;
  String path_foto = 'Tire uma foto para seu crachar!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Criação de Crachás"),
      centerTitle: true,
      backgroundColor: Colors.yellow,
    );
  }

  _corpo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            path_foto,
          ),
          SizedBox(
            height: 20,
          ),
          file != null
              ? Image.file(file)
              : Image.asset(
                  "assets/images/camera.png",
                  height: 150,
                ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 60,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      _camera();
                    }),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                    icon: Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _galeria();
                    }),
                _nome(),
                _drodownArea(),
                _btn(),
                _texto(Resultado),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _camera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }

  void _galeria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }

  _nome() {
    return TextField(
      decoration: InputDecoration(
          labelText: "Nome:",
          labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      controller: nomeController,
    );
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _drodownArea() {
    return DropdownButton<String>(
      value: area,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 25),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          area = newValue!;
        });
      },
      items: <String>['Enfermagem', 'Recepção', 'Administração', 'Hotelaria']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _btn() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 35.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _confirmar,
          child: Text("Salvar",
              style: TextStyle(color: Colors.white, fontSize: 35.0)),
          color: Colors.purpleAccent[200],
        ),
      ),
    );
  }

  void _confirmar() {
    setState(() {
      String nome = nomeController.text.toString();

      Resultado = 'Criação do Cracha:\n Foto: $file Nome: $nome\n Área: $area';
    });
  }
}
