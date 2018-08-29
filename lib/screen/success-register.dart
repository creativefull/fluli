import 'package:flutter/material.dart';

class SuccessRegister extends StatefulWidget{
  SuccessRegisterState createState()=>  SuccessRegisterState();
}


class SuccessRegisterState extends State<SuccessRegister> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child : Text("Your Register Successfull, Please Login for access your account", style: TextStyle(
                fontSize: 30.0
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: FlatButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("Login Now"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> routes) => false);
                },
              )
            )
          ],
        )
      ),
    );
  }
}