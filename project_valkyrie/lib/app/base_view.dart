import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Parcel',
      style: optionStyle,
    ),
    Text(
      'Index 2: Calender',
      style: optionStyle,
    ),
    Text(
      'Index 3: More',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    //TODO: use provider to change index and thus change the display of icons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base View'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.markunread,
            ),
            title: Text('Parcel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            title: Text('Calender'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            title: Text('more'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        selectedIconTheme:
            IconThemeData(color: Colors.green[800], opacity: 1.0, size: 25.0),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme:
            IconThemeData(color: Colors.grey, opacity: 1.0, size: 25.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
