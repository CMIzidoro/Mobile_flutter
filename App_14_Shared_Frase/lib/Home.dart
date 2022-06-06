import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchDay = false;
  bool _switchSize = false;
  double fontSize = 20;
  var colorBackground = Colors.black;
  var colorText = Colors.white;

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("day", _switchDay);
    await prefs.setBool("Size", _switchSize);

    print("Save! Day: $_switchDay.toString(), Size: $_switchSize.ToString()");
  }

  _recover() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _switchDay = prefs.getBool("Day")!;
      _switchSize = prefs.getBool("Size")!;
    });

    print(
        "Method recover Day: $_switchDay.toString(). Size: $_switchSize.ToString()");
  }

  _remove() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("name");

    print("Method Remove");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pharse")),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("Day"),
              _btnSwitchDay(),
              Text("Small"),
              _btnSwitchSize(),
            ]),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text("Save", style: TextStyle(fontSize: 20)),
                  onPressed: _save,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text("Recover", style: TextStyle(fontSize: 20)),
                  onPressed: _recover,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text("Remove", style: TextStyle(fontSize: 20)),
                  onPressed: _remove,
                ),
              ],
            ),
            Row(children: <Widget>[
              Flexible(
                  child: SingleChildScrollView(
                      child: Text(
                "William Shakespeare was a renowned English poet, playwright, and actor born in 1564 in Stratford-upon-Avon. His birthday is most commonly celebrated on 23 April (see When was Shakespeare born), which is also believed to be the date he died in 1616.",
                style: TextStyle(
                    fontSize: fontSize,
                    backgroundColor: colorBackground,
                    color: colorText),
              )))
            ])
          ],
        ),
      ),
    );
  }

  _btnSwitchDay() {
    return Switch(
      value: _switchDay,
      onChanged: (value) {
        setState(() {
          _switchDay = value;
          if (value == true) {
            colorBackground = Colors.black;
            colorText = Colors.white;
          } else {
            colorBackground = Colors.white;
            colorText = Colors.black;
          }
        });
      },
    );
  }

  _btnSwitchSize() {
    return Switch(
      value: _switchSize,
      onChanged: (value) {
        setState(() {
          _switchSize = value;
          if (value == true) {
            fontSize = 25;
          } else {
            fontSize:
            20;
          }
        });
      },
    );
  }
}
