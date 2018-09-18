import 'dart:math';

import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import '../components/chooice.dart';
import './step2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/api.dart' show apiURL;
import 'package:http/http.dart' as http;

class Step1 extends StatefulWidget{
  Step1({Key key, this.title}):super(key:key);
  final String title;
  
  Step1State createState()=>  Step1State();
}


class Step1State extends State<Step1> {
  DatabaseReference tmpDeals;
  String emailAddress = '';
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tmpDeals = FirebaseDatabase.instance.reference().child('tmpDeals');
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    FirebaseDatabase.instance.setPersistenceCacheSizeBytes(10000000);
    tmpDeals.keepSynced(true);
  }

  @override
  dispose() {
    super.dispose();
  }

  void saveTmpDeals(BuildContext context) async {
    _formKey.currentState.save();
    if(_formKey.currentState.validate()) {
      final _user = await FirebaseAuth.instance.currentUser();
      Map<String, dynamic> dataToSend = {
        'strategy' : widget.title,
        'address' : emailAddress,
        'uid' : _user.uid
      };

      // final key = Random.secure();
      // final String cacheStep = key.nextDouble().toString();
      // DatabaseReference datanya = tmpDeals.child(_user.uid).push();
     
      // datanya.set(<String, String>{
      //   'strategy' : widget.title,
      //   'address' : emailAddress,
      //   'uid' : _user.uid
      // }).then((results) {
      //   Navigator.push(context, new MaterialPageRoute(
      //     builder: (_) => new Step2(title: widget.title, cacheStep: cacheStep)
      //   ));
      // }).catchError((error) {
      //   print(error);
      // });

      http.Response response = await http.post(apiURL + '/tmpDeals/new', body: dataToSend);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      appBar: new AppBar(
        title: new Text("ADD NEW " + widget.title),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: new EdgeInsets.all(20.0),
          child : new SizedBox(
            width: double.infinity,
            child: new Container(
              padding: new EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                color: const Color(0xFF5EFAF7).withOpacity(0.2)
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Step 1 - Enter Address", style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  )),
                  new SizedBox(height: 20.0),
                  new Form(
                    key: _formKey,
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: new BorderRadius.circular(20.0)
                        ),
                        errorStyle: TextStyle(
                          color: Colors.red
                        ),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      onSaved: (String value) {
                        setState(() {
                          emailAddress = value;
                        });
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Email address is not valid";
                        }
                        return null;
                      },
                    ),
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new FlatButton(
                        child: new Row(
                          children: <Widget>[
                            new Icon(Icons.arrow_back_ios),
                            new Text('GO BACK', style: new TextStyle(fontSize: 10.0))
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      new FlatButton(
                        child: new Row(
                          children: <Widget>[
                            new Text('CONTINUE TO STEP 2', style: new TextStyle(fontSize: 10.0),),
                            new Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                        onPressed: () {
                          saveTmpDeals(context);
                        },
                      ),
                    ],
                  ),

                  new SizedBox(
                    height: 50.0,
                  ),
                  new ChooiceCustom()
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}