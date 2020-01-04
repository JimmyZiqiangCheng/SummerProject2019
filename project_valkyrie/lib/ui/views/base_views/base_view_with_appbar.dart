import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/services/notification_service.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_bottom_navigation_bar.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_drawer.dart';

class BaseViewWithAppBar<T extends ChangeNotifier> extends StatefulWidget {
  final String routePath;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModalReady;

  BaseViewWithAppBar({Key key, this.builder, this.model, this.child, this.onModalReady, this.routePath}) : super(key: key);

  @override
  _BaseViewWithAppBarState<T> createState() => _BaseViewWithAppBarState<T>();
}

class _BaseViewWithAppBarState<T extends ChangeNotifier> extends State<BaseViewWithAppBar<T>> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModalReady != null) {
      widget.onModalReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(getTitle(widget.routePath), style: TextStyle(color: Colors.white),),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColorDark,
            actions: <Widget>[
              _notificationBadge(context),
            ],
          ),
          body: widget.child,
          bottomNavigationBar: MyBottomNavigationBar(
            scaffoldKey: _scaffoldKey,
            selected: getBottomNavBarIndex(widget.routePath),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }

  String getTitle(String routePath) {
    switch (routePath) {
      case RoutePaths.home:
        return 'Home Sample';
      case RoutePaths.parcel:
        return 'Parcel Sample ';
      case RoutePaths.calendar:
        return 'Calendar Sample';
      case RoutePaths.lostKeys:
        return 'Lost Key Sample';
      default:
        return 'Unknown';
    }
  }

  int getBottomNavBarIndex(String routePath) {
    switch (routePath) {
      case RoutePaths.home:
        return 0;
      case RoutePaths.parcel:
        return 1;
      case RoutePaths.calendar:
        return 2;
      default:
        return 3;
    }
  }

  Widget _notificationBadge(context){
    final _notificationCounter = Provider.of<NotificationService>(context);
    return Badge(
      position: BadgePosition.topRight(top: 0, right: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        _notificationCounter.counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.notifications), onPressed: () {_notificationCounter.plus();}),
    );
  }
}
