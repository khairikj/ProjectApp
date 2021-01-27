import 'package:flutter/material.dart';
import 'package:flutter_project/acccust.dart';
import 'package:flutter_project/historycust.dart';
import 'package:flutter_project/homecust.dart';
import 'package:flutter_project/services/auth.dart';


class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    AccountCustomer(),
    HomeCustomer(),
    HistoryCustomer(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MyBooking'),
        leading: Container(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
          onTap: () async{
                await _auth.signOut();
          },
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'History'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        fixedColor: Colors.red,
      ),
    );
  }
}
