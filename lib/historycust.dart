import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[500],
        elevation: 1.0,
        title: Text('HISTORY'),
      ),
      endDrawer: Drawer(
          child: ListView(children: <Widget>[
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit account info'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Account',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'HIstory'),
      ]),
    );
  }
}
