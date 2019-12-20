import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavi extends StatelessWidget {
  BottomNavi({@required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override


  Widget build(BuildContext context) {
    final selected = Provider.of<ValueNotifier<int>>(context);
    final bottomNaviKey = GlobalKey();
    return BottomNavigationBar(
      key: bottomNaviKey,
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
            Icons.add,
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
      onTap: (_index) => _ontap(_index, selected, context, bottomNaviKey),
    );
  }

  void _ontap(_index, selected, context, bottomNaviKey) {
    final bottomPos = MediaQuery.of(context).size.height;

    if (_index != selected.value) {
      if (_index != 3) selected.value = _index;
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
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(1000, bottomPos-220, 0.0, bottomNaviKey.currentContext.size.height),
            items: [
              PopupMenuItem(
                value: 0,
                child: FlatButton(
                    onPressed: () {
                      print('keys');
                    },
                    child: Text("Lost keys")),
              ),
              PopupMenuItem(
                value: 1,
                child: FlatButton(
                    onPressed: () {
                      print('Maintenance Report');
                    },
                    child: Text("Maintenance Report")),
              ),
              PopupMenuItem(
                value: 2,
                child: FlatButton(
                    onPressed: () {
                      print('Rent Payment');
                    },
                    child: Text("Rent Payment")),
              ),
            ],
            elevation: 3.0,
          );
          break;
        default:
          return;
      }
    }
  }
}
