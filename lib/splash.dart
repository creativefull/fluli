import 'dart:async';

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
  Future<bool> checkUserLoggedIn() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser() != null) {
      var user = await _auth.currentUser();
      await user.reload();
      if (user.isEmailVerified) {
        return true;
      } else {
        return false;
      }
    } else {
      Navigator.pop(context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Legendary Investor",
      initialRoute: checkUserLoggedIn() != null ? "/" : "/login",
      routes: {
        "/" : (BuildContext context) => new PageDefault(),
        "/login" : (BuildContext context) => new LoginApp(),
        "/register" : (BuildContext context) => new Register(),
        "/register/success" : (BuildContext context) => new SuccessRegister()
      },
    );
  }
}