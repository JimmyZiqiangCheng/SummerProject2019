
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/base_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
    @ required this.user
  }): super(key:key);
  final FirebaseUser user;
  
  @override
  Widget build(BuildContext context) {
    return BaseView();
  }
}