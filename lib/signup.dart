import 'package:flutter/material.dart';
import 'package:flutter_project/decorations.dart';
import 'package:flutter_project/login.dart';
import 'package:flutter_project/services/auth.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({ this.toggleView });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  int selectedRadio;
  void initState() {
    super.initState();
    selectedRadio=0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

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
          key: _formKey,
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
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val );
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                  setState(() => password = val );
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecoration.copyWith(hintText: 'Shop Address'),
              ),
              Container(
                child: ButtonBar(),
              ),
              SizedBox(width: 20.0),
              RadioListTile(
                value: 1,
                groupValue: selectedRadio,
                title: Text('Owner'),
                onChanged: (val) {
                  print('Radio $val');
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedRadio,
                title: Text('Customer'),
                onChanged: (val) {
                  print('Radio $val');
                  setSelectedRadio(val);
                },
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red[800],
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                         loading = false;
                         error = 'please supply a valid email';
                        });
                    }
                  }
                  }),
              SizedBox(height: 20.0),
              Container(
                child: InkWell(
                    child: new Text(
                        'Already have an account? Click here to LOGIN'),
                    onTap: () {
                      widget.toggleView();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
