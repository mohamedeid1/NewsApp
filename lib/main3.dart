import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp1State();
  }
}

class MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("color"),
        ),
        body: Container(
          color: Color.fromARGB(100, 20, 60, 70),
        ),
      ),
    );
  }
}

main() {
  runApp(MyApp1());
}
