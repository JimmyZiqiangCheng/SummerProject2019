import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selected;
  final GlobalKey<ScaffoldState> scaffoldKey;
  MyBottomNavigationBar({@required this.scaffoldKey, this.selected = 0});
  @override


  Widget build(BuildContext context) {
    //final selected = Provider.of<ValueNotifier<int>>(context);
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
      currentIndex: selected,
      selectedItemColor: Theme.of(context).primaryColorDark,
      selectedIconTheme:
          IconThemeData(color: Theme.of(context).primaryColorDark, opacity: 1.0, size: 25.0),
      unselectedItemColor: Theme.of(context).primaryColor,
      unselectedIconTheme:
          IconThemeData(color: Theme.of(context).primaryColorLight, opacity: 1.0, size: 25.0),
      onTap: (_index) => _ontap(_index, selected, context, bottomNaviKey),
    );
  }

  void _ontap(_index, selected, context, bottomNaviKey) {
    final bottomPos = MediaQuery.of(context).size.height;
    if (_index == 3){
      if (selected != 3) {
        selected = 3;
      }
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(1000, bottomPos-220, 0.0, bottomNaviKey.currentContext.size.height),
        items: [
          PopupMenuItem(
            child: FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RoutePaths.lostKeys);
                },
                child: Text("Lost keys")),
          ),
          PopupMenuItem(
            child: FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RoutePaths.maintenance);
                },
                child: Text("Maintenance Report")),
          ),
          PopupMenuItem(
            child: FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RoutePaths.rent);
                },
                child: Text("Rent Payment")),
          ),
        ],
        elevation: 3.0,
      );
    }else{
      if (_index != selected) {
        selected = _index;
        switch (_index) {
          case 0:
            Navigator.popAndPushNamed(context, RoutePaths.home);
            break;
          case 1:
            Navigator.popAndPushNamed(context, RoutePaths.parcel);
            break;
          case 2:
            Navigator.popAndPushNamed(context, RoutePaths.calendar);
            break;
          default:
            return;
        }
      }
    }
  }
}