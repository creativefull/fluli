import 'package:flutter/material.dart';

class UnCompleteList extends StatefulWidget{
  UnCompleteListState createState()=>  UnCompleteListState();
}


class UnCompleteListState extends State<UnCompleteList> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text("Uncomplete List", style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.only(top : 20.0),
        children: <Widget>[
          new ListTile(
            title: Text("Seller Name"),
            leading: CircleAvatar(
              child: Icon(Icons.linear_scale),
            ),
            subtitle: Column(
              children: <Widget>[
                Text("Kragan Sedan Ds Karangasem Rt 01 Rw 01")
              ],
            ),
          )
        ],
      ),
    );
  }
}