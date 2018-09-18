import 'dart:async';
import 'dart:convert';

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
  
  Future<List<TmpModel>> getData() async {
    List<TmpModel> results = [];

    DataSnapshot data = await tmpDeals.child(_user.uid).once();
    data.value.forEach((x) {
      if (x != null) {
        results.add(TmpModel(address: x['address']));
      }
    });
    
    return results;
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
        child: _user == null ? CircularProgressIndicator() : FutureBuilder<List<TmpModel>>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Failed to load data from server");
            } else if (snapshot.hasData) {
              // TmpModel tmpData = new TmpModel.fromSnapshot(data);
              List<Widget> dataList = [];
              snapshot.data.forEach((value) {
                dataList.add(Text(value.address));
              });
              return Column(
                children: dataList,
              );
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