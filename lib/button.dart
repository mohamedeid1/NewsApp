import 'package:flutter/material.dart';

var str = "";
var a = Colors.blue;

class button1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return button1state();
  }
}

class button1state extends State<button1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("my app button1"),
          backgroundColor: a,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                str,
                style: TextStyle(color: Colors.pink, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {});
                },
                color: Colors.blue,
                child: Text(
                  "flat buttttton",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.green, width: 2.5),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() => str = ("hello!!!!"));
                  a = Colors.green;
                },
                child: Text(
                  "click me",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.black38,
                splashColor: Colors.green,
                highlightColor: Colors.brown,
                elevation: 50,
              ),
              RaisedButton(
                onPressed: () => setState(() {
                  str = "";
                  a = Colors.blue;
                }),
                child: Text(
                  "click me",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.black38,
                splashColor: Colors.green,
                highlightColor: Colors.brown,
                elevation: 50,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() {
            a = Colors.brown;
          }),
          icon: Icon(
            Icons.add_alert,
            color: Colors.cyan,
          ),
          label: Text("alarm"),
        ),
      ),
    );
  }
}

main() {
  runApp(button1());
}
