import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validate/validate.dart';
import './login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class FormRegister extends StatefulWidget {
  @override
  _FormRegisterState createState() => new _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  String name = '';
  String email = '';
  String password = '';
  String cpassword = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
      // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showLoadingPage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new ShowLoading()
    );
  }

  void onSubmitForm(BuildContext context) {
    _formKey.currentState.save();
    showLoadingPage(context);

    if (_formKey.currentState.validate()) {
      _auth.createUserWithEmailAndPassword(email: email, password: password).then((results) async {
        await results.sendEmailVerification();
        UserUpdateInfo updateInfo = new UserUpdateInfo();
        updateInfo.displayName = name;
        _auth.updateProfile(updateInfo);
        await results.reload();

        Firestore.instance.collection('users').document().setData(<String, dynamic>{
          'uid' : results.uid,
          'name' : name,
          'email' : email,
          'password' : password,
          'isVerified' : results.isEmailVerified
        }).then((response) {
          print("Response e kyok ngene $response");
        }).catchError((error) {
          print(error);
        });

        Navigator.pushNamedAndRemoveUntil(context, "/register/success", (Route<dynamic> route) => false);
      }).catchError((error) {
        // print(error);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: new Text("Your Email already existing"),
          )
        );
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Your Name",
                errorStyle: TextStyle(
                  color: Colors.red
                )
              ),
              validator: (String value) {
                if (value.length <= 0) {
                  return "Name can't be empty";
                }
                return null;
              },
              onSaved: (String value) {
                setState(() {
                  name = value;
                });
              },
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Your Email",
                errorStyle: TextStyle(
                  color: Colors.red
                )
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                try {
                  Validate.isEmail(value);
                } catch(e) {
                  return 'The E-mail Address must be a valid email address';
                }
                return null;
              },
              onSaved: (String value) {
                setState(() {
                  email = value;
                });
              },            
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Your Password"
              ),
              validator: (String value) {
                if (value.length < 8) {
                  return "Password must be at least 8 characters";
                }
                return null;
              },
              onSaved: (String value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Confirmation Password",
                errorStyle: TextStyle(
                  color: Colors.red
                )
              ),
              validator: (String value) {
                if (value != password) {
                  return 'Confirmation password did not match';
                }
                return null;
              },
              obscureText: true,
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
                    onSubmitForm(context);
                  }
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      )
    );
  }
}