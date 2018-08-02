import 'package:flutter/material.dart';

class AddNewDeal extends StatefulWidget {

  @override
  AddNewDealState createState() => new AddNewDealState();
}

class AddNewDealState extends State<AddNewDeal> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add New Deals"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Text("What is Your Strategy?")
          ],
        ),
      ),
    );
  }
}