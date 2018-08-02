import 'package:flutter/material.dart';
import './addNewDeal.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key key, this.title, this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(bottom: 10.0),
      child: new FlatButton(
        onPressed: onTap,
        color: Colors.yellow[900],
        textColor: Colors.white,
        padding: new EdgeInsets.all(20.0),
        child: new SizedBox(
          width: double.infinity,
          child: new Center(
            child : Text(title, style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            )),
          ),
        ),
      ),
    );
  }
}

class PanelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 20.0),
      child: new Column(
        children: <Widget>[
          CustomButton(title : 'ADD NEW DEAL', onTap : () {
            Navigator.of(context).pushNamed("/addNewDeal");
          }),
          CustomButton(title : 'MY CALENDAR', onTap : () {
            Navigator.of(context).pushNamed("/addNewDeal");
          }),
          CustomButton(title : 'QUICK TOOLS', onTap : () {
            Navigator.of(context).pushNamed("/addNewDeal");
          }),                    
          // customButton('MY CALENDAR', () {}),
          // customButton('QUICK TOOLS', () {}),
        ],
      ),
    );    
  }
}

class MainApp extends StatefulWidget {
  MainAppState createState() => new MainAppState();
}

class MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "LEGENDARY INVESTOR",
      theme: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue
      ),
      routes: <String, WidgetBuilder>{
        '/addNewDeal' : (BuildContext context) => new AddNewDeal()
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("OVERVIEW", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text("My Deals", style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      )),
                      new SizedBox(
                        height: 10.0,
                      ),
                      new SizedBox(
                        width: double.infinity,
                        child: new Container(
                          padding: new EdgeInsets.only(top: 40.0, right : 20.0, left: 20.0, bottom: 40.0),
                          color: Colors.yellow[900],
                          child: new Center(
                            child : new Text("Your Deal Will Be Here", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                          )
                        )
                      ),
                      new PanelButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}