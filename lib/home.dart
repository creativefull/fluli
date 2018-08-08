import 'package:flutter/material.dart';
import './addNewDeal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screen/login.dart';

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
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => new HomeApp(),
        '/addNewDeal' : (BuildContext context) => new AddNewDeal(),
        '/login' : (BuildContext context) => new LoginApp(),
      },
    );
  }
}

class HomeApp extends StatefulWidget {
  HomeAppState createState() => new HomeAppState();
}

class HomeAppState extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("OVERVIEW", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext contexts) {
                    return AlertDialog(
                      title: Text('Are you sure want to logout ?'),
                      actions: <Widget>[
                        new FlatButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(contexts);
                          }
                        ),
                        new FlatButton(
                          child: Text("Yes, Logout"),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            FirebaseUser _user = await FirebaseAuth.instance.currentUser();
                            Navigator.pop(contexts);
                            Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    );
                  }
                );
              },
              child: Icon(Icons.last_page, color: Colors.blue),
            )
          ],
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
    );
  }
}