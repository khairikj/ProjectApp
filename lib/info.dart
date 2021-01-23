import 'package:flutter/material.dart';
import 'package:flutter_project/decorations.dart';
import 'package:flutter_project/login.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  int selectedRadio;
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[300],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red[500],
          elevation: 1.0,
          title: Text('INFO'),
          leading: Container(),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Name/Shop Name'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Phone Number'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textDecoration.copyWith(hintText: 'Address/Shop Adress'),
              ),
              SizedBox(height: 20.0),
              RadioListTile(
                value: 1,
                groupValue: selectedRadio,
                title: Text('Owner'),
                activeColor: Colors.white,
                onChanged: (val) {
                  print('Radio $val');
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedRadio,
                title: Text('Customer'),
                activeColor: Colors.white,
                onChanged: (val) {
                  print('Radio $val');
                  setSelectedRadio(val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red[800],
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
            ]))));
  }
}
