import 'package:flutter/material.dart';
import '../components/chooice.dart';
import './step3.dart';

class Step2 extends StatefulWidget{
  Step2({Key key, this.title}):super(key:key);
  final String title;
  
  Step2State createState()=>  Step2State();
}


class Step2State extends State<Step2> {
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
                  new Text("Seller Name", style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  )),
                  new SizedBox(height: 20.0),
                  new TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: new BorderRadius.circular(20.0)
                      ),
                      fillColor: Colors.white,
                      filled: true
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
                            new Text('CONTINUE TO STEP 3', style: new TextStyle(fontSize: 10.0),),
                            new Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (_) => new Step3(title: widget.title)
                          ));
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