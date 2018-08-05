import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Register extends StatefulWidget{
  RegisterState createState()=>  RegisterState();
}


class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context){
    timeDilation = 5.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            FlatButton.icon(
              icon: Icon(Icons.arrow_back_ios),
              label: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: new Hero(
                tag: 'image-splash',
                child: Material(
                  child: InkWell(
                    child: new Image.asset('assets/img/logo.png', width: 150.0)
                  ),
                )
              )
            ),
            Center(
              child: Text("Register New Account", style: TextStyle(fontSize: 25.0))
            ),
            SizedBox(
              height: 10.0,
            ),
            FormRegister()
          ],
        ),
      ),
    );
  }
}

class FormRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Your Name"
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Your Email"
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Your Password"
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Confirmation Password"
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Text("Please Check Your Data Before Submiting Data", style: TextStyle(fontSize: 12.0)),
              ),
              FlatButton(
                child: Text("Register Now"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: const EdgeInsets.only(left : 40.0, right : 40.0),
                onPressed: () {
                  Navigator.pushNamed(context, "/register/success");
                },
              )
            ],
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}