import 'package:flutter/material.dart';
import './screen/uncompleted.dart';
import './home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screen/login.dart';

class PageDefault extends StatefulWidget{
  PageDefaultState createState()=>  PageDefaultState();
}


class PageDefaultState extends State<PageDefault> {
  int i = 0;
  bool loggedIn = true;
  
  var pages = [
    new MainApp(),
    new UnCompleteList(),
    new Container(),
    new Container(),
    new Container()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser == null) {
        setState(() {
          loggedIn = false;
        });
      }
    });
  }

  @override
  void dispose() {
      // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: !loggedIn ? new LoginApp() : Scaffold(
        body: pages[i],
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon : new Icon(Icons.home),
              title: new Text('Home')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.check),
              title: new Text('Uncompleted Deals')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.local_hospital),
              title: new Text('New Deals')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.check_circle),
              title: new Text('Completed Deals')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.person),
              title: new Text('Profile')
            )
          ],
          currentIndex: i,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
        ),
      ),
    );
  }
}