import 'package:flutter/material.dart';
import 'package:flutter_project/decorations.dart';
import 'package:flutter_project/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        elevation: 1.0,
        title: Text('SIGN UP'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Shop Name'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Phone Number'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Shop Address'),
              ),
              Container(
                child: ButtonBar(),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red[800],
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
                
              Container(
                child: InkWell(
                    child: new Text(
                        'Already have an account? Click here to LOGIN'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
