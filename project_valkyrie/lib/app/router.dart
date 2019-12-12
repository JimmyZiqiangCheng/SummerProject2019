
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/home/home_page.dart';
import 'package:project_valkyrie/app/log_in/log_in_page.dart';
import 'package:project_valkyrie/app/log_in/sign_up_page.dart';
import 'package:project_valkyrie/app/log_in/welcome_page.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage(),fullscreenDialog: true);
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage(),fullscreenDialog: true);
      case '/home':
        if (args is FirebaseUser) {
          return MaterialPageRoute(builder: (_) => Home(user:args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Wrong route, or wrong argument passed.'),
        ),
      );
    });
  }
}