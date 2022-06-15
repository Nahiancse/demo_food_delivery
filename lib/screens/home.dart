import 'package:ass2/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'profile.dart';  


class MyNavigationBar extends StatefulWidget {  
  
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 1;  
  static const List<Widget> _widgetOptions = <Widget>[  
     
    Text('Cart Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    HomeScreen(),
    Profile()
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
       
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.shopping_bag,color: Colors.white),  
            label: 'Cart',
            backgroundColor: Colors.black  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home,color: Colors.white),  
            label: 'Home',
            backgroundColor: Colors.black  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.person,color: Colors.white),  
            label: 'Profile',   
            backgroundColor: Colors.black,  
          ),  
        ],  
        // type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.red,  
        iconSize: 30,  
        onTap: _onItemTapped,  
        elevation: 3  
      ),  
    );  
  }  
}  