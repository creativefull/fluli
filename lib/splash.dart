import 'package:flutter/material.dart';
import './pagedefault.dart';
import './screen/login.dart';
import './screen/register.dart';
import './screen/success-register.dart';

class SplashScreen extends StatefulWidget{
  SplashScreenState createState()=>  SplashScreenState();
}


class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Legendary Investor",
      initialRoute: "/login",
      routes: {
        "/" : (BuildContext context) => new PageDefault(),
        "/login" : (BuildContext context) => new LoginApp(),
        "/register" : (BuildContext context) => new Register(),
        "/register/success" : (BuildContext context) => new SuccessRegister()
      },
    );
  }
}