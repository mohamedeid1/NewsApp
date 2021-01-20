import 'package:flutter/material.dart';

Color a = Colors.white;
Color b = Colors.black;
Color r = Colors.red;

class ageButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return agebuttonstate();
  }
}

class agebuttonstate extends State<ageButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("agecalc"),
          backgroundColor: r,
        ),
        body: Container(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

main() {
  runApp(ageButton());
}
