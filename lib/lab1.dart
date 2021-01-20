import 'package:flutter/material.dart';

var b = Colors.black;
var w = Colors.white;
var r = Colors.red;
var g = Colors.green;
bool passwordvisible = true;

class Mylab1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Mylab1app();
  }
}

class Mylab1app extends State<Mylab1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("my label 1"),
          backgroundColor: r,
        ),
        body: Container(
          color: b,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: g,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: w,
                          width: 4.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      labelText: "text field",
                      labelStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                      hintText: "enter your name",
                      hintStyle: TextStyle(
                        color: r,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "name",
                      labelStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                      ),
                      hintText: "enter your name",
                      hintStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                      ),
                      icon: Icon(Icons.person_outline),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                      hintText: "enter your mail",
                      hintStyle: TextStyle(
                        color: r,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "password",
                      labelStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                      hintText: "enter your password",
                      hintStyle: TextStyle(
                        color: r,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordvisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordvisible = !passwordvisible;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordvisible,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "phone",
                      labelStyle: TextStyle(
                        color: b,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                      hintText: "enter your phone",
                      hintStyle: TextStyle(
                        color: r,
                        fontWeight: FontWeight.w400,
                      ),
                      icon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: w,
          onPressed: () => setState(() {
            b = b == Colors.white ? Colors.black : Colors.white;
            w = w == Colors.black ? Colors.white : Colors.black;
          }),
        ),
      ),
    );
  }
}

main() {
  runApp(Mylab1());
}
