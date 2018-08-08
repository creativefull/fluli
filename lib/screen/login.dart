import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validate/validate.dart';

class LoginApp extends StatefulWidget{
  LoginAppState createState()=>  LoginAppState();
}


class LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
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
                child: FormLogin(),
              ),
            ],
          ),
        )
    );
  }
}

class FormLogin extends StatefulWidget {
  FormLoginState createState() => new FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  Timer timer;
  String email = '';
  String password = '';
  final _formKey = new GlobalKey<FormState>();

  void submitLogin(BuildContext context) {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => ShowLoading()
      ).whenComplete(() {
        print("Complete");
      });

      timer = new Timer(Duration(seconds: 1), () {
        FirebaseAuth _auth = FirebaseAuth.instance;
        _auth.signInWithEmailAndPassword(email: email, password: password).then((results) {
          results.reload();
          Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
        }).catchError((error) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: Text('Login Failed'),
                content: Text('Please check your email and password before login'),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Back"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            }
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black
              )
            ),
            hintText: "Email",
            suffixIcon: Icon(Icons.email),
            errorStyle: TextStyle(
              color: Colors.red
            )
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (String value) {
            try {
              Validate.isEmail(value);
            } catch (e) {
              return "Email Address is not valid";
            }
          },
          onSaved: (String value) {
            setState(() {
              email = value;
            });
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.blue)
            ),
            hintText: "Password",
            suffixIcon: Icon(Icons.lock),
            errorStyle: TextStyle(
              color: Colors.red
            )            
          ),
          obscureText: true,
          onSaved: (String value) {
            setState(() {
              password = value;
            });
          },
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
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            },
            child: new Text("Create New Account")
          )
        ),
      ],
      )
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