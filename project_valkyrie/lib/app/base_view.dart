import 'package:flutter/material.dart';
import 'package:project_valkyrie/common_widgets/bottom_navi.dart';
import 'package:project_valkyrie/common_widgets/drawer.dart';

class BaseView extends StatefulWidget {
  final Widget bodyWidget;
  final String title;

  BaseView({
    Key key,
    @ required this.title,
    @ required this.bodyWidget,
  }): super(key:key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      // page title
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // body, main contents
      body: widget.bodyWidget,
      // bottom navigation bar with pop-up menu
      bottomNavigationBar: BottomNavi(scaffoldKey: _scaffoldKey),

      drawer: MyDrawer(),
    );
  }
}
