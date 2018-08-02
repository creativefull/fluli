import 'package:flutter/material.dart';
import './home.dart';

class PageDefault extends StatefulWidget{
  PageDefaultState createState()=>  PageDefaultState();
}


class PageDefaultState extends State<PageDefault> {
  int i = 0;
  
  var pages = [
    new MainApp(),
    new Container(),
    new Container(),
    new Container(),
    new Container()
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: pages[i],
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon : new Icon(Icons.home),
              title: new Text('Home')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.check),
              title: new Text('Home')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.local_hospital),
              title: new Text('New Deals')
            ),
            new BottomNavigationBarItem(
              icon : new Icon(Icons.check_circle),
              title: new Text('Home')
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