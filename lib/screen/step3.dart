import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Step3 extends StatefulWidget{
  Step3({Key key, this.title, @required this.cacheStep}):super(key:key);
  final String title;
  final String cacheStep;
  
  Step3State createState()=>  Step3State();
}


class Step3State extends State<Step3> {
  DatabaseReference tmpDeals;
  String arv = '';
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

      tmpDeals.child(_user.uid).child("tmp" + widget.cacheStep.replaceAll(".", "")).update({
        'strategy' : widget.title,
        'arv' : arv,
        'uid' : _user.uid
      }).then((results) {
        // Navigator.push(context, new MaterialPageRoute(
        //   builder: (_) => new Step3(title: widget.title, cacheStep: widget.cacheStep)
        // ));
      }).catchError((error) {
        print(error);
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F1),
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Column(
          children: <Widget>[
            new Text("ADD NEW"),
            new Text(widget.title)
          ],
        ),
        centerTitle: true,
        leading: new Icon(Icons.notifications, size: 40.0),
        automaticallyImplyLeading: false,
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
                  new Center(
                    child : new Text("QUICK MAO", style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    )),
                  ),
                  new Center(
                    child : new Text("ENTER ARV", style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    )),
                  ),
                  new SizedBox(height: 20.0),
                  new Form(
                    key: _formKey,
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: new BorderRadius.circular(20.0)
                        ),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        setState(() {
                          arv = value.toString();
                        });
                      },
                    ),
                  ),
                  new Center(
                    child: new Text("Zillow Range (\$7,5000)", style: new TextStyle(
                      fontSize: 15.0
                    ),),
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
                            new Text('CONTINUE TO STEP 4', style: new TextStyle(fontSize: 10.0),),
                            new Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                        onPressed: () {
                          saveTmpDeals(context);
                        },
                      ),
                    ],
                  ),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}