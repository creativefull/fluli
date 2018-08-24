import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './pagedefault.dart';
import './screen/login.dart';
import './screen/register.dart';
import './screen/success-register.dart';

class SplashScreen extends StatefulWidget{
  SplashScreenState createState()=>  SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser != null) {
        if (firebaseUser.isEmailVerified) {
          setState(() {
            loggedIn = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Legendary Investor",
      routes: {
        "/login" : (BuildContext context) => new LoginApp(),
        "/register" : (BuildContext context) => new Register(),
        "/register/success" : (BuildContext context) => new SuccessRegister()
      },
      home: loggedIn == true ? new PageDefault() : new LoginApp()
    );
  }
}