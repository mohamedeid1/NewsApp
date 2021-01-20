import 'package:flutter/material.dart';
import 'package:app01/api/authentication_api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  AuthenticationAPI authenticationAPI = AuthenticationAPI();
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: (_isloading) ? _drawloading() : _drawloadingform(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawloadingform() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "please enter your username";
              }
            },
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextFormField(
            validator: (Value) {
              if (Value.isEmpty) {
                return "enter your password";
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  //TODO : call api
                  setState(() {
                    _isloading = true;
                  });
                  await authenticationAPI.login(
                      "okuneva.donavon@example.com", "password");
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawloading() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
