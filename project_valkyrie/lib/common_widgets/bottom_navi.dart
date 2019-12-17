import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavi extends StatelessWidget {
  BottomNavi({@required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<ValueNotifier<int>>(context);
    
    return BottomNavigationBar(
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
        onTap: (_index) => _ontap(_index, selected, context),
      );
  }
  void _ontap(_index, selected, context){
      if (_index != selected.value){
        _index != 3 ? selected.value = _index : null;
        switch (_index) {
          case 0:
            Navigator.of(context).pushNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushNamed('/parcel');
            break;
          case 2:
            Navigator.of(context).pushNamed('/calendar');
            break;
          case 3:
            scaffoldKey.currentState.openDrawer();
            break;
          default:
            return;
        }
      }
    }
}