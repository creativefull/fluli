import 'package:flutter/material.dart';
import './screen/login.dart';

class SplashScreen extends StatefulWidget{
  SplashScreenState createState()=>  SplashScreenState();
}


class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context){
    return LoginApp();
  }
}