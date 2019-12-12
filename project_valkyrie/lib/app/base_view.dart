import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView extends StatelessWidget {
  // final _selectedIndex = 1;
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

  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<ValueNotifier<int>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base View'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selected.value),
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
        currentIndex: selected.value,
        selectedItemColor: Colors.green[800],
        selectedIconTheme:
            IconThemeData(color: Colors.green[800], opacity: 1.0, size: 25.0),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme:
            IconThemeData(color: Colors.grey, opacity: 1.0, size: 25.0),
        onTap: (_index) => selected.value = _index,
      ),
    );
  }
}
