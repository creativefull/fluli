import 'package:flutter/material.dart';

class ChooiceCustom extends StatefulWidget{
  ChooiceCustomState createState()=>  ChooiceCustomState();
}


class ChooiceCustomState extends State<ChooiceCustom> {
  @override
  Widget build(BuildContext context){
    return Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new SelectBox(content: "PREQUALIFY THE SELLER"),
              new SelectBox(content: "SCHEDULE THE APPOINTMENT")
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new SelectBox(content: "ANALYZE THE DEAL"),
              new SelectBox(content: "SECURE THE DEAL")
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new SelectBox(content: "TAKE PHOTOS"),
              new SelectBox(content: "MARKET THE DEAL")
            ],
          )
        ],
      ),
    );
  }
}


class SelectBox extends StatelessWidget {
  SelectBox({Key key, this.content}):super(key:key);

  final String content;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child : new Padding(
        padding : new EdgeInsets.only(right : 10.0, bottom: 10.0),
        child : new SizedBox(
          height: 100.0,
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.black, width: 1.0)
            ),
            child: new Center(child : Text(content)),
          ),
        )
      )
    );
  }
}