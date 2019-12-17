
import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/calendar/calendar_page.dart';
import 'package:project_valkyrie/app/home/home_page.dart';
import 'package:project_valkyrie/app/log_in/log_in_page.dart';
import 'package:project_valkyrie/app/log_in/sign_up_page.dart';
import 'package:project_valkyrie/app/log_in/welcome_page.dart';
import 'package:project_valkyrie/app/parcel/parcel_page.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage(),fullscreenDialog: true);
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage(),fullscreenDialog: true);
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/calendar':
        return MaterialPageRoute(builder: (_) => CalendarPage());
      case '/parcel':
        return MaterialPageRoute(builder: (_) => ParcelPage());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Center(
          child: Text('Wrong route, or wrong argument passed.'),
        ),
      );
    });
  }
}

// Usage
// Navigator.push(context,AppSlideRightRoute(widget: DetailScreen(),),);
class AppSlideRightRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  AppSlideRightRoute({this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class AppSlideLeftRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  AppSlideLeftRoute({this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}