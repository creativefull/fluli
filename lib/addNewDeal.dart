import 'package:flutter/material.dart';
import './screen/step1.dart';

class AddNewDeal extends StatefulWidget {
  @override
  AddNewDealState createState() => new AddNewDealState();
}

class AddNewDealState extends State<AddNewDeal> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: new AppBar(
        title: new Text("Add New Deals"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child : new Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 30.0),
                new Text("What is Your Strategy?", style: new TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                )),
                new SizedBox(height: 40.0),
                new Column(
                  children: <Widget>[
                    new ButtonList(
                      label: 'Wholesale',
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (_) => new Step1(title: 'Wholesale')));
                      },
                    ),
                    new ButtonList(
                      label: 'Flip/Rehab',
                      onTap: () {},
                    ),
                    new ButtonList(
                      label: 'Rental',
                      onTap: () {},
                    ),
                    new ButtonList(
                      label: 'Lease Option (Coming Soon)',
                      onTap: () {},
                    ),
                    new ButtonList(
                      label: 'Commercial (Coming Soon)',
                      onTap: () {},
                    ),
                    new FlatButton.icon(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textColor: Colors.blue,
                      label: new Text('GO BACK TO HOME SCREEN', style: new TextStyle(fontWeight: FontWeight.bold)),
                      icon: new Icon(Icons.arrow_back_ios),
                    )
                  ],
                )
              ],
            ),
          )
        )
      ),
    );
  }
}


class ButtonList extends StatelessWidget {
  ButtonList({Key key, this.label, this.onTap}):super(key:key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(bottom: 10.0),
      child : new SizedBox(
        width: double.infinity,
        child : new FlatButton(
          child: new Text(label),
          onPressed: onTap,
          color: Colors.white,
          textColor: Colors.blue,
          padding: new EdgeInsets.all(10.0),
        )
      )
    );
  }
}