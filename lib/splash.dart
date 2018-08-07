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
  bool checkUserLoggedIn() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Legendary Investor",
      initialRoute: checkUserLoggedIn() ? "/" : "/login",
      routes: {
        "/" : (BuildContext context) => new PageDefault(),
        "/login" : (BuildContext context) => new LoginApp(),
        "/register" : (BuildContext context) => new Register(),
        "/register/success" : (BuildContext context) => new SuccessRegister()
      },
    );
  }
}