import 'dart:async';

import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget{
  LoginAppState createState()=>  LoginAppState();
}


class LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Login Application",
      home: new Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left : 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: new Hero(
                  tag: 'image-splash',
                  child: new Material(
                    child: new InkWell(
                      child: Image.asset('assets/img/logo.png', width: 100.0,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              new Text('Legendary Investor', style: new TextStyle(fontSize: 30.0)),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: FormLogin(
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  Timer timer;

  void submitLogin(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => ShowLoading()
    ).whenComplete(() {
      print("Complete");
    });

    timer = new Timer(Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black
              )
            ),
            hintText: "Email",
            suffixIcon: Icon(Icons.email)
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.blue)
            ),
            hintText: "Password",
            suffixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: FlatButton(
            child: new Text("SIGN IN", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            onPressed: () {
              submitLogin(context);
            },
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        new Center(
          child: new Text("Create New Account")
        ),
      ],
    );
  }
}


class ShowLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          children: <Widget>[
            new CircularProgressIndicator(),
            Padding(
              padding: new EdgeInsets.only(left : 20.0),
              child: new Text("Checking Your Data ..."),
            )
          ],
        ),
      )
    );
  }
}