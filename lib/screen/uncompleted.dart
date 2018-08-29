import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/*
=================
IMPORT MODELS
=================
*/
import '../models/tmp-model.dart';

class UnCompleteList extends StatefulWidget{
  UnCompleteListState createState()=>  UnCompleteListState();
}


class UnCompleteListState extends State<UnCompleteList> {
  DatabaseReference tmpDeals;
  FirebaseUser _user;

  @override
  void initState() {
    super.initState();

    tmpDeals = FirebaseDatabase.instance.reference().child('tmpDeals');
    FirebaseAuth.instance.currentUser().then((result) {
      setState(() {
        _user = result;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text("Uncomplete List", style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: _user == null ? CircularProgressIndicator() : StreamBuilder(
          stream: tmpDeals.child(_user.uid).onValue,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Failed to load data from server");
            } else if (snapshot.hasData) {
              DataSnapshot data = snapshot.data.snapshot;
              print("DATA YANG DARI SINI ${data.value}");
              TmpModel tmpData = new TmpModel.fromSnapshot(data);
              print(tmpData.address);
              return Text(tmpData.address);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}